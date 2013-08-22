require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should ensure_length_of(:username).is_at_least(5)}
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do 
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe '#can_comment_on_post?' do
    let!(:post) { FactoryGirl.create(:post) }
    let!(:user) { post.user }
    it 'should return true if user has not already commented' do 
      expect( user.can_comment_on_post?(post) ).to eq true
    end
    it 'should return false if user has already commented' do
      comment = FactoryGirl.create(:comment, user: user, post: post)
      expect( user.can_comment_on_post?(post) ).to eq false
    end
  end
end
