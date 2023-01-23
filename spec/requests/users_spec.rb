require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Abdul',
      photo: 'https://unsplash.com/photos/4ct0iDMOjuc',
      bio: 'I am a software developer',
      posts_counter: 2
    )
  end

  context 'GET #index for all users' do
    before(:each) { get users_path }
    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template(:index)
    end
    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  context 'GET #show for a particular user' do
    before(:each) { get user_path(@user) }
    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders show template' do
      expect(response).to render_template(:show)
    end
  end
end
