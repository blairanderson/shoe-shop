require 'spec_helper'

describe BlogPostWebHook do
  let(:user) { FactoryGirl.create(:user) }
  let(:payload) do
    {
      user: {email: user.email, id: 1525774},
      id: 185131,
      name: "Jordan Release Dates 2014",
      content: "i think this is working\n\nHOLY Crap this is amazing. \n\nlike totally awesome",
      content_html: "<p>i think this is working</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      content_html_raw: "<p>i think this is working</p><p>HOLY Crap this is amazing. </p><p>like totally awesome</p>",
      updated_at: "2014-02-15T17:53:47-07:00",
      created_at: "2013-11-25T09:07:08-07:00",
      folder_id: nil, parent_id: nil, token: nil
    }
  end

  describe '#new' do
    before do
      @service = BlogPostWebHook.new(payload)
      @post = @service.blog_post
    end

    it "exposes a BlogPost" do
      expect(@post).to be_a(BlogPost)
    end

    describe 'data mapping' do
      it 'uses the NAME as the title' do
        expect(@post.title).to eq payload[:name]
      end

      it 'uses the ID as the identifier' do
        expect(@post.identifier).to eq payload[:id]
      end

      it 'assigns content' do
        expect(@post.content).to eq payload[:content]
      end

      it 'assigns content_html' do
        expect(@post.content_html).to eq payload[:content_html]
      end

      it 'assigns content_html_raw' do
        expect(@post.content_html_raw).to eq payload[:content_html_raw]
      end
    end

    context 'if a blog-post does not exist' do
      it 'builds a new instance' do
        expect(@post).to be_a_new_record
      end
    end

    context 'if a blog-post does exist' do
      it 'updates the blog-post'
    end
  end

  describe '#include_user' do
    it 'attaches the user to the blog post'
    it 'deletes the post if user does not exist'
  end
end