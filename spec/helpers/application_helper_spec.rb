require 'spec_helper'

describe ApplicationHelper do
  let(:target_count) { 15 }

  describe "user_count" do
    it 'should display the total count of users' do
      User.stub(:count).and_return(target_count)
      expect( user_count ).to eq target_count
    end
  end

  describe "post_count" do
    it 'should return the total number of posts' do
      Post.stub(:count).and_return(target_count)
      expect( post_count ).to eq target_count
    end
  end

  describe "image_count" do
    it 'should return the total number of images' do
      Image.stub(:count).and_return(target_count)
      expect( image_count ).to eq target_count
    end
  end

  describe "dollar count" do
    it 'should return the total number of dollars' do
      total = 1234567
      Post.stub(:sum).with("price").and_return(total)
      expect( dollar_count ).to eq total
    end
  end

end
