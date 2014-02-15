require 'spec_helper'

describe ProfilePresenter do
  before :all do
    @user =  FactoryGirl.create(:user)
    @posts = FactoryGirl.create_list(:post,5, user: @user)
  end
  let!(:user){ @user}
  describe '.find' do 
    it 'should find a user' do 
      user_profile = ProfilePresenter.find(user.id)
      expect(user_profile.id).to eq user.id
      expect(user_profile.username).to eq user.username
    end
  end

  context 'for a given user' do 
    let(:user_profile) { ProfilePresenter.find(user.id) }
    describe '#upvotes' do
      it 'should return the total upvotes' do
        expect(user_profile.upvotes).to eq user.posts.sum('cached_votes_up')
      end
    end

    describe '#downvotes' do 
      it 'should return the total downvotes' do 
        expect(user_profile.downvotes).to eq user.posts.sum('cached_votes_down')
      end
    end

    describe '#score' do 
      it 'should return the upvotes minus the downvotes' do 
        expect(user_profile.score).to eq user.posts.sum('cached_votes_score')
      end
    end

    describe '#views' do 
      it 'should return the sum of views from posts' do 
        expect(user_profile.views).to eq user.posts.sum('impressions_count')
      end
    end

    describe '#influence' do 
      it 'should return a mixture of votes and view count' do
        expect(user_profile.influence).to eq user_profile.upvotes + user_profile.views + user_profile.score
      end
    end
  end
end
