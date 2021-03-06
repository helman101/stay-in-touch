require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'test', password: 'testing', email: 'email@email.com') }

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:liked_posts).through(:likes) }
    it { should have_many(:friendships) }
    it { should have_many(:confirmed_friendships).class_name('Friendship') }
    it { should have_many(:friends).through(:confirmed_friendships).source(:requested) }
    it { should have_many(:pending_friendships).class_name('Friendship') }
    it { should have_many(:pending_friends).through(:pending_friendships).source(:requested) }
    it { should have_many(:inverted_friendships).class_name('Friendship') }
    it { should have_many(:friend_requests).through(:inverted_friendships).source(:requestor) }
  end
end
