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
    it { should have_many(:watched_items).dependent(:destroy) }
    it { should have_many(:watched_posts).through(:watched_items)}
  end

  describe '#watching?' do 
  end
end
