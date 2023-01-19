require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'Abdul', photo: 'https://unsplash.com/photos/4ct0iDMOjuc', bio: 'Teacher from Kenya.')
    @post = Post.new(title: 'This post', text: 'My first post', author: @user, comments_counter: 3,
                     likes_counter: 4)
  end

  context 'Test implementation post model' do
    it 'check the post length to be less than 250' do
      expect(@post.title).to(satisfy { |title| title.length < 250 })
    end
    it 'most recent post length should return 0' do
      expect(@post.five_recent_comments.length).to eq(0)
    end
    it 'likes count validation to return true' do
      expect(@post.likes_counter).to(satisfy { |x| x >= 0 })
    end
  end
end
