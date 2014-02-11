require 'spec_helper'

describe UsersController do
  describe 'POST #create' do
    it 'creates a valid user' do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user)
        }.to change{ User.count }.by(1)
    end
    describe "forbidden actions" do
      before do
        @username = "valid_username"
        @email = "valid_email@example.com"
        @user = FactoryGirl.create(:user, username: @username, email: @email)
        expect(@user).to be_valid
      end
      it 'forbids a duplicate username'
      it 'forbids a duplicate email'
    end 
  end
end