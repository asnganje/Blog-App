require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Abdul',
      photo: 'https://unsplash.com/photos/4ct0iDMOjuc',
      bio: 'I am a software developer',
      posts_counter: 2
    )

    @post = Post.create(
      author: @user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 2
    )
  end

  context 'GET #index for a particular post by the user' do
    before(:each) { get user_posts_path(@user) }
    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  context 'GET #show about a particular post by the user' do
    before(:each) { get user_post_path(@user, @post) }
    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders show template' do
      expect(response).to render_template(:show)
    end
  end
end
