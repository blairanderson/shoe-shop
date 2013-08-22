require 'spec_helper'

describe Comment do
  describe 'validations' do 
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :body }
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id).with_message("Can only comment once per post.")}
  end
end
