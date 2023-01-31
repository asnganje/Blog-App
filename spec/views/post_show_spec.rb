require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user1 = User.create(
        name: 'Abdul',
        bio: 'Aspiring FullStack Dev',
        photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
        posts_counter: 2
    )

    @post1 = Post.create(
      author: @user1,
      title: 'Test',
      text: 'First Post',
      comments_counter: 2,
      likes_counter: 2
    )

    @post2 = Post.create(
      author: @user1,
      title: 'Working?',
      text: 'Second post',
      comments_counter: 1,
      likes_counter: 2
    )
    
    @comment1 = Comment.create(post: @post1, author: @user1, text: 'Is it working?')
    @comment2 = Comment.create(post: @post1, author: @user1, text: 'Hey')
    Comment.create(post: @post2, author: @user1, text: 'How are you?')

    Like.create(post: @post1, author: @user1)
    Like.create(post: @post2, author: @user1)
  end

  describe 'A post with title, comments and counter' do
    it 'shows the post title' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Test')
    end

    it 'shows writer of the post' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Abdul')
    end

    it 'shows total comments for a post' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('4')
    end

    it 'shows total likes for a post' do
      visit user_post_path(@user1, @post2)
      expect(page).to have_content('3')
    end

    it 'displays the other parts of a post body' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('First Post')
    end

    it 'shows username and comment of each commentor' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content(@comment1.author.name)
      expect(page).to have_content(@comment1.text) 
      expect(page).to have_content(@comment2.author.name)
      expect(page).to have_content(@comment2.text)
    end
  end
end
