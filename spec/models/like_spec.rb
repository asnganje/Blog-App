require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(title: 'This is my first post', text: 'My first one', author: @user, comments_counter: 1,
                     likes_counter: 2)
  end
  it 'should increment likes counter by 1' do
    @post.increment!(:likes_counter)
    expect(@post.likes_counter).to eq(3)
  end
end
