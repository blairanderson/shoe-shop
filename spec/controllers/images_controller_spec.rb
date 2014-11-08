require 'spec_helper'

describe ImagesController do
  let(:image) { FactoryGirl.create(:image) }
  let(:post) { image.post }
  let(:user) { post.user }
  let(:valid_attributes) { {"url" => "mystring"} }

  describe "POST create" do
  end
end
