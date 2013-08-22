require 'spec_helper'

describe Image do
  describe 'validations' do 
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:url)}
  end

  describe '#url_size' do 
    let(:image) {FactoryGirl.create(:image)}
    it "should allow for variable sizes, including 900" do
      target_url = image.url + "/convert?rotate=0&w=900&h=900&fit=max" 
      expect(image.url_size(900)).to eq target_url
    end
  end
end
