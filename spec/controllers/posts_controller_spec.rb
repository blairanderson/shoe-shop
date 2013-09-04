require 'spec_helper'

describe PostsController do
  describe "POST callback" do
    let(:callback_params) do
      {"residence_country"=>"US", 
      "invoice"=>"abc1234", 
      "address_city"=>"San Jose", 
      "first_name"=>"John", 
      "payer_id"=>"TESTBUYERID01", 
      "shipping"=>"3.04", 
      "mc_fee"=>"0.44", 
      "txn_id"=>"662452434", 
      "receiver_email"=>"seller@paypalsandbox.com", 
      "quantity"=>"1", 
      "custom"=>"xyz123", 
      "payment_date"=>"19:36:19 3 Sep 2013 PDT", 
      "address_country_code"=>"US", 
      "address_zip"=>"95131", 
      "tax"=>"2.02", 
      "item_name"=>"something", 
      "address_name"=>"John Smith", 
      "last_name"=>"Smith", 
      "receiver_id"=>"seller@paypalsandbox.com", 
      "item_number"=>"AK-1234", 
      "verify_sign"=>"Adqkp7v50IUIfuUzXxkRvZdKbYrdAgN7F1S9kJWbAV8wUYNiptL2bb4L", 
      "address_country"=>"United States", 
      "payment_status"=>"Completed", 
      "address_status"=>"confirmed", 
      "business"=>"seller@paypalsandbox.com", 
      "payer_email"=>"buyer@paypalsandbox.com", 
      "notify_version"=>"2.1", 
      "txn_type"=>"web_accept", 
      "test_ipn"=>"1", 
      "payer_status"=>"verified", 
      "mc_currency"=>"USD", 
      "mc_gross"=>"12.34", 
      "address_state"=>"CA", 
      "mc_gross1"=>"9.34", 
      "payment_type"=>"instant", 
      "address_street"=>"123, any street", 
      "action"=>"callback", 
      "controller"=>"posts"}
    end

    it 'should build a payment object with the valid keys' do
      valid_keys = %w(id payer_status payment_status payment_date verify_sign item_name first_name last_name address_name address_street address_city address_zip address_state address_country address_status receiver_email receiver_id business payer_email)
      pair = FactoryGirl.create(:post)
      valid_params = callback_params.merge(id: pair.id.to_s)
      post :callback, valid_params

      expect( assigns(:paypay).response.keys ).to eq valid_keys
    end
  end

end
