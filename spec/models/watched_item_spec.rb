require 'spec_helper'

describe WatchedItem do
  describe 'associations' do 
    it { should belong_to :user }
    it { should belong_to :post }
  end

  describe 'validations' do
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :user_id }
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id).with_message("Already Watching") }
  end
end