require 'spec_helper'


describe BlogPostsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:payload_params) do
    {
      user: {email: user.email, id: 1525774},
      id: 185131,
      name: "Jordan Release Dates 2014",
    }.to_json
  end

  let(:invalid_params) do
    {
      user: {email: Faker::Internet.email, id: 1},
      id: 'invalid',
      name: "Jordan Release Dates 2014",
    }.to_json
  end


  describe 'POST #webhook' do
    it 'finds the admin author' do
      webhook_service = double('BlogPostWebHook.new')
      BlogPostWebHook.should_receive(:new).and_return(webhook_service)
      webhook_service.should_receive(:include_user)
      post :webhook, token: 12345, payload: payload_params
      expect(assigns(:user)).to eq user
    end

    it 'ignores the POST request if the admin does not exist' do
      post :webhook, token: 12345, payload: invalid_params
      expect(response.status).to eq 422
    end
  end

  describe 'GET #index' do
    it 'displays all the blog-posts' do
      count = 5
      posts = FactoryGirl.create_list(:blog_post, count)
      get :index
      expect( assigns(:blog_posts).count ).to eq count
    end
  end

  describe 'GET #show' do
    it 'finds the blog post by the local ID' do
      post = FactoryGirl.create(:blog_post)
      get :show, id: post.id
      expect( assigns(:blog_post) ).to eq post
    end
  end
  
end