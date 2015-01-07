require 'spec_helper'

describe User do
  describe 'validations' do
  end

  describe 'associations' do 
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_one(:keychain).dependent(:destroy) }
  end

  describe '#remove_twitter_authentication' do
    it 'removes keychain' do
      user = FactoryGirl.create(:user, :authenticated_with_twitter)
      expect(user).to be_valid
      expect(user.twitter).to be_present
      expect(user.keychain).to be_valid

      user.remove_twitter_authentication

      expect(user.provider).to be_nil
      expect(user.uid).to be_nil
      expect(user.twitter).to be_nil
      expect(user.keychain).to be_nil
    end
  end

  describe 'scopes' do
    describe '.with_posts' do
      before do
        3.times { FactoryGirl.create(:user) }
        5.times { FactoryGirl.create(:post) }
        expect(User.count).to eq 8
      end

      it 'should return users with posts' do
        users = User.with_posts

        expect(users.count).to eq 5
      end
    end
  end
end
