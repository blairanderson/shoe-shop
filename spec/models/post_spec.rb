require 'spec_helper'

describe Post do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :scoreboard }
    it { should validate_presence_of :body }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price}
    it { should ensure_length_of(:title).is_at_most(80) }
    describe 'with zero images' do
      describe 'status set to :for_sale' do
        let(:post) { FactoryGirl.create(:post) }
        it 'should be invalid' do
          expect(post).to be_valid

          post.for_sale!
          expect(post).to be_invalid
          expect(post.errors.get(:images_count)).to include("Must have images to sell these shoes.")
        end
      end
    end
  end

  describe 'associations' do 
    it { should belong_to :user }
    it { should belong_to :size }
    it { should have_one :paypal_callback }
    it { should have_many(:images).dependent(:destroy)}
    it { should have_many(:comments).dependent(:destroy)}
    it { should have_many(:watched_items).dependent(:destroy) }
    it { should have_many(:watchers).through(:watched_items)}
  end

  describe 'scopes' do 
    describe '.active' do
      it 'should only return posts where visible is true' do
        FactoryGirl.create_list(:post, 5)
        Post.active.each do |post|
          expect(post.status).to eq :for_sale
        end
      end
    end

    describe '.inactive' do 
      it 'should only return draft posts' do
        FactoryGirl.create_list(:post, 2)
        Post.inactive.each do |post|
          expect(post.status).to eq :draft
        end
      end
    end
  end

  describe 'instance methods' do 
    let(:post){ FactoryGirl.create(:post) }
    describe '#score' do 
      it 'should equal cached_votes_score' do 
        expect(post.score).to eq post.cached_votes_score
      end
    end

    describe '#update_scoreboard' do
      it 'should return a proper score' do
        post.update_scoreboard
        post.scoreboard.should be > 0
        post.reload.scoreboard.should be > 0
      end
    end
  end
end
