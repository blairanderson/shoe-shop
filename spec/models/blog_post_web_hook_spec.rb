require 'spec_helper'

describe BlogPostWebHook do
  let(:user) { FactoryGirl.create(:user) }
  let(:payload) do
    {
      user: {email: user.email, id: 1525774},
      id: 185131,
      name: "Jordan Release Dates 2014",
      content: "This is a Blog Post\n\n![sometext](https://draftin.com:443/images/9130?token=RF_gmGlJYKpIeRR35O5CwqcpfvUkTrqt0AEB69UKMMr-h5TGNGrJGwNFCvr4mGQCq0pOKEDI3_0wAAlr3D45Iyc) \n\n[link to solesout](http://www.solesout.com/blog)",
      content_html: "<p>This is a Blog Post</p><p><img src=\"https://draftin.com:443/images/9130?token=RF_gmGlJYKpIeRR35O5CwqcpfvUkTrqt0AEB69UKMMr-h5TGNGrJGwNFCvr4mGQCq0pOKEDI3_0wAAlr3D45Iyc\" alt=\"sometext\"></p><p><a href=\"http://www.solesout.com/blog\">link to solesout</a></p>",
      content_html_raw: "<p>This is a Blog Post</p><p><img src=\"https://draftin.com:443/images/9130?token=RF_gmGlJYKpIeRR35O5CwqcpfvUkTrqt0AEB69UKMMr-h5TGNGrJGwNFCvr4mGQCq0pOKEDI3_0wAAlr3D45Iyc\" alt=\"sometext\"> </p><p><a href=\"http://www.solesout.com/blog\">link to solesout</a></p>",
      updated_at: "2014-02-15T17:53:47-07:00",
      created_at: "2013-11-25T09:07:08-07:00",
      folder_id: nil, parent_id: nil, token: nil
    }
  end

  describe '#new' do
    it "exposes a BlogPost" do
      service = BlogPostWebHook.new(payload)
      expect(service.blog_post).to be_a(BlogPost)
    end

    xit 'exposes the raw data' do
      service = BlogPostWebHook.new(payload)
      expect(service.raw_data).to eq payload
    end

    describe 'data mapping' do
      let(:service) { BlogPostWebHook.new(payload) }
      let(:post)    { service.blog_post }

      it 'uses the NAME as the title' do
        expect(post.title).to eq payload[:name]
      end

      it 'uses the ID as the identifier' do
        expect(post.identifier).to eq payload[:id]
      end

      it 'assigns content' do
        expect(post.content).to eq payload[:content]
      end

      it 'assigns content_html' do
        expect(post.content_html).to eq payload[:content_html]
      end

      it 'assigns content_html_raw' do
        expect(post.content_html_raw).to eq payload[:content_html_raw]
      end

      it 'assigns images' do
        expect(post.images).to eq ["https://draftin.com:443/images/9130?token=RF_gmGlJYKpIeRR35O5CwqcpfvUkTrqt0AEB69UKMMr-h5TGNGrJGwNFCvr4mGQCq0pOKEDI3_0wAAlr3D45Iyc"]
      end
    end

    context 'if a blog-post does not exist' do
      let(:service) { BlogPostWebHook.new(payload) }
      let(:post)    { service.blog_post }
      it 'builds a new instance' do
        expect(post).to be_a_new_record
      end
    end
  end
  describe 'if a blog-post does exist' do
    before do
      @blog_post = FactoryGirl.create(:blog_post, identifier: payload[:id])
      service = BlogPostWebHook.new(payload)
      @post = service.blog_post
    end
    it 'updates the blog-post' do
      expect(@post).to eq @blog_post
    end
  end

  describe '#include_user' do
    it 'attaches the user to the blog post'
    it 'deletes the post if user does not exist'
  end
end