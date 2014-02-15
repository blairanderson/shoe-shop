require 'spec_helper'

describe CommentsController do

  let(:commenting_user) { FactoryGirl.create(:user) }
  let(:pair_owner) { FactoryGirl.create(:user) }
  let(:pair) { FactoryGirl.create(:post, user: pair_owner)}
  
  describe 'POST create' do
    it 'should build a comment for a user and a post' do
      controller.current_user = commenting_user
      valid_params = { post_id: pair.to_param , comment:{body: Faker::Lorem.sentences(5).join}}

      post :create, valid_params
      
      expect(response).to redirect_to post_path(pair)
      
      target = Comment.last
      expect(target.user).to eq commenting_user
      expect(target.post).to eq pair
    end
  end

  describe 'GET edit' do 
    it 'should be visible to the comment owner' do 
      controller.current_user = pair.user
      comment = pair.comments.create(body: Faker::Lorem.sentences(5).join, user_id: pair.user.id)
      get :edit, id: comment.id
      expect(response).to be_success
      expect(response).to render_template :edit
      expect( assigns(:comment) ).to eq comment
    end
  end
end
