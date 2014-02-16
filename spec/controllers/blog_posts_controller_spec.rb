require 'spec_helper'


describe BlogPostsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:payload_params) do
    {
      user: {email: user.email, id: 1525774},
      folder_id: nil,
      id: 185131,
      name: "Jordan Release Dates 2014",
      parent_id: nil,
      token: nil,
      content: "i think this is working\n\nHOLY Crap this is amazing. \n\nlike totally awesome",
      content_html: "<p>i think this is working</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      content_html_raw: "<p>i think this is working</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      updated_at: "2014-02-15T17:53:47-07:00",
      created_at: "2013-11-25T09:07:08-07:00"
    }
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
      invalid_params = payload_params.clone
      invalid_params[:user][:email] = Faker::Internet.email
      invalid_params[:user][:id] = "invalid"
      post :webhook, token: 12345, payload: invalid_params
      expect(response.status).to eq 422
    end
  end

  describe 'GET #index' do
    it 'displays all the blog-posts' do
      posts = FactoryGirl.create_list(:blog_post, 5)
      get :index
      expect( assigns(:blog_posts) ).to eq posts
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