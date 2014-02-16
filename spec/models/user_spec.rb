require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should ensure_length_of(:username).is_at_least(5)}
    it { should allow_value('flombay').for(:username) }
    it { should allow_value('wakkaflakka').for(:username) }
    it { should allow_value('123___41234').for(:username) }
    it { should allow_value('qwer---1234').for(:username) }
    it { should_not allow_value('asdf asdf').for(:username) }
    it { should_not allow_value('a s d f').for(:username) }
    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do 
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:watched_items).dependent(:destroy) }
    it { should have_many(:watched_posts).through(:watched_items) }
    it { should have_one(:keychain).dependent(:destroy) }
    it { should have_many(:blog_posts).dependent(:destroy) }
  end
end
