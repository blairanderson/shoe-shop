require 'spec_helper'

describe Post do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :brand }
    it { should validate_presence_of :body }
    it { should validate_presence_of :price }
    it { should ensure_length_of(:title).is_at_most(50) }
  end

  describe 'associations' do 
    it { should belong_to :user }
    it { should belong_to :size }
    it { should have_many(:images).dependent(:destroy)}
  end

  describe 'scopes' do 
    describe '.active' do
      it 'should only return posts where visible is true' do 
        FactoryGirl.create_list(:post, 5, visible: true)
        expect(Post.active.count).to eq 5
        Post.active.each do |post|
          expect(post.visible).to eq true
        end
      end
    end

    describe '.inactive' do 
      it 'should only return posts where visible is false' do
        FactoryGirl.create_list(:post, 2)
        expect(Post.inactive.count).to eq 2
        Post.inactive.each do |post|
          expect(post.visible).to eq false
        end
      end
    end
  end

  describe 'instance methods' do 
    describe '#status' do 
      it 'should happy if visible' do 
        post.visible = true
        expect(post.status).to eq "Post is Visible"
      end
      it 'should be unhappy if not visible' do 
        expect(post.status).to eq "Post is Not Visible"
      end
    end

    it '#score should equal cached_votes_score' do 
      expect(post.score).to eq post.cached_votes_score
    end
  end

end
