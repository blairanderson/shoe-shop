require 'spec_helper'

describe Statistics do
  let(:target_count) { 15 }
  let(:stats) { Statistics.load }

  describe "user_count" do
    it 'should display the total count of users' do
      User.stub(:count).and_return(target_count)
      expect( stats[:users] ).to eq target_count
    end
  end

  describe "post_count" do
    it 'should return the total number of posts' do
      Post.stub(:count).and_return(target_count)
      expect( stats[:posts] ).to eq target_count
    end
  end

  describe "image_count" do
    it 'should return the total number of images' do
      Image.stub(:count).and_return(target_count)
      expect( stats[:images] ).to eq target_count
    end
  end

  describe "dollar count" do
    xit 'should return the total number of dollars' do
      total = 1234567
      Post.active.stub(:sum).with("price").and_return(total)
      expect( stats[:dollars_active] ).to eq total
    end
  end

end