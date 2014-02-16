require 'spec_helper'


describe BlogPostsController do
  let(:params) do
    {payload: {
      user: {
        email: "blair81@gmail.com",
        id: 1525774
        },
      folder_id:null,
      id: 185131,
      name: "Jordan Release Dates 2014",
      parent_id: null,
      token: null,
      content: "i think this is workingdfasdfasdfasdfasdfdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf\n\nHOLY Crap this is amazing. \n\nlike totally awesome",
      content_html: "<p>i think this is workingdfasdfasdfasdfasdfdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      content_html_raw: "<p>i think this is workingdfasdfasdfasdfasdfdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      updated_at: "2014-02-15T17:53:47-07:00",
      created_at: "2013-11-25T09:07:08-07:00",
    }}
  end

  describe 'POST #webhook' do
    it 'finds the admin author'
    it 'rejects the POST request if the admin does not exist'

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