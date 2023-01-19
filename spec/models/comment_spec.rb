require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(title: 'This is my first post', text: 'My first one', author: @user, comments_counter: 1,
                     likes_counter: 2)
    @comment = Comment.new(text: 'This is my first comment', author: @user, post: @post)
  end

  it 'it is not valid without a text' do
    @comment.text = 'This is my first comment'
    expect(@comment).to be_valid
  end
  it 'is only valid when it has a user' do
    @comment.author = @user
    expect(@comment).to be_valid
  end
  it 'is only valid when it has a post' do
    @comment.post = @post
    expect(@comment).to be_valid
  end

  it 'should increment comments counter by 1' do
    @post.increment!(:comments_counter)
    expect(@post.comments_counter).to eq(2)
  end
end
