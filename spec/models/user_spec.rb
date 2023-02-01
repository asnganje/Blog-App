require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: 'Abdul', photo: 'https://unsplash.com/photos/4ct0iDMOjuc', bio: 'Teacher from Kenya.',
                    posts_counter: 1)
  end

  context 'validations tests' do
    it 'name should not be blank and have an attribute' do
      expect(@user.name).to eq('Abdul')
    end
    it ' if it is valid it should return a photo' do
      expect(@user.photo).to eq('https://unsplash.com/photos/4ct0iDMOjuc')
    end
    it 'if it is valid it should return a bio' do
      expect(@user.bio).to eq('Teacher from Kenya.')
    end

    it 'posts counter should be an integer' do
      @user.posts_counter = 2
      expect(@user).to be_valid
    end
    it 'post count is invalid if it is a string or nil' do
      @user.posts_counter = 'two'
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end
    it 'Recent posts should return 0' do
      expect(@user.three_recent_posts.length).to eq(0)
    end
  end
end
