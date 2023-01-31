require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
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
        comments_counter: 1,
        likes_counter: 2
      )

      @post2 = Post.create(
        author: @user1,
        title: 'Working?',
        text: 'Second post',
        comments_counter: 2,
        likes_counter: 2
      )

    Comment.create(post: @post1, author: @user1, text: 'You like it?')
    Comment.create(post: @post1, author: @user1, text: 'Keep it up!')
    Comment.create(post: @post2, author: @user1, text: 'Are you ok?')

    Like.create(post: @post1, author: @user1)
    Like.create(post: @post2, author: @user1)
  end

  describe 'a post index page' do
    it 'displays the user photo' do
      visit user_path(@user1)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/NDCy2-9JhUs']")
    end

    it 'displays the user name' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Abdul')
    end

    it 'shows the title of the post' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('First Post')
    end

    it 'displays total posts by the user has written' do
      visit user_posts_path(@user1)
      expect(page).to have_content('4') #comments have also been considered as posts
    end

    it 'can see some of the post body' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Test')
      expect(page).to have_content('Working?')
      expect(page).to have_content('First Post')
      expect(page).to have_content('Second post')
    end

    it 'shows how many comments and likes a post has' do
      visit user_posts_path(@user1)
      expect(page).to have_content('3')
    end

    it 'shows first comments of a post' do
      visit user_posts_path(@user1.id, @post1)
      expect(page).to have_content('You like it?')
    end

    it 'it redirects me to a posts show page when the post is clicked' do
      visit user_posts_path(@user1)
      click_link @post1.title
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end

    it 'show page when the post is clicked' do
      visit user_posts_path(@user1)
      click_link @post2.title
      expect(page).to have_current_path(user_post_path(@user1, @post2))
    end
  end
end
