require 'spec_helper'

describe PaypalCallback do
  describe "validations" do
    it { should validate_presence_of :post_id }
  end

  describe "associations" do
    it { should belong_to(:post) }
  end

  describe '#trigger_status_change' do
    let(:post) { FactoryGirl.create(:post) }
    it 'should flip the post status to SOLD' do
      expect(post.status).to eq :draft
      
      paypal_callback = post.create_paypal_callback
      expect(paypal_callback.persisted?).to eq true

      paypal_callback.trigger_status_change

      expect(post.reload.status).to eq :sold
    end    
  end
end
