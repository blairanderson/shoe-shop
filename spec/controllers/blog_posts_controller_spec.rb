require 'spec_helper'


describe BlogPostsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:payload_params) do
    {payload: {
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
      created_at: "2013-11-25T09:07:08-07:00"}
    }
  end

  describe 'POST #webhook' do
    it 'finds the admin author' do
      post :webhook, token: 12345, params: payload_params
      expect(assigns(:user)).to eq user
    end


    it 'rejects the POST request if the admin does not exist' do
      # post :webhook, token: 12345, params: payload_params
      
    end

    it 'attempts to find a blog-post with the provided identifier'

    describe 'data mapping' do
      it 'uses the NAME as the title'
      it 'uses the parameterized NAME as the slug'
      it 'uses the ID as the identifier'
      it 'saves the content, content_html, content_html_raw'
    end
    context 'if a blog-post does not exist' do
      it 'creates a blog-post'
      it 'attributes the blog-post to the author'
    end

    context 'if a blog-post does exist' do
      it 'updates the blog-post'
    end
  end

  describe 'GET #index' do
    it 'displays all the blog-posts'
  end

  describe 'GET #show' do
    it 'finds the blog post by the local ID'

  end
  
end