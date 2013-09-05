require 'spec_helper'

describe PostsController do
  describe "POST callback" do
    let(:callback_params) do
      {
        "mc_gross"=>"1.00",
        "protection_eligibility"=>"Eligible",
        "address_status"=>"confirmed",
        "payer_id"=>"86SXQR5UAZYLC",
        "tax"=>"0.00",
        "address_street"=>"201 2nd St. S\r\n#101",
        "payment_date"=>"19:44:03 Sep 04, 2013 PDT",
        "payment_status"=>"Completed",
        "charset"=>"windows-1252",
        "address_zip"=>"98033",
        "first_name"=>"Jonas",
        "mc_fee"=>"0.33",
        "address_country_code"=>"US",
        "address_name"=>"Jonas Nelson",
        "notify_version"=>"3.7",
        "custom"=>"",
        "payer_status"=>"verified",
        "business"=>"blair81@gmail.com",
        "address_country"=>"United States",
        "address_city"=>"Kirkland",
        "quantity"=>"1",
        "verify_sign"=>"ApBHX6qbpxJW-Ll3oP22LSbo0WeuAVQTSPOAwCjG-XALhnEd7XwJeG0Z",
        "payer_email"=>"jonaswnelson@gmail.com",
        "txn_id"=>"3A345053FJ844903U",
        "payment_type"=>"instant",
        "last_name"=>"Nelson",
        "address_state"=>"WA",
        "receiver_email"=>"blanderson00@gmail.com",
        "payment_fee"=>"0.33",
        "receiver_id"=>"FU8FFDD8AX574",
        "txn_type"=>"web_accept",
        "item_name"=>"iPhone4, size: 6 $1",
        "mc_currency"=>"USD",
        "item_number"=>"",
        "residence_country"=>"US",
        "handling_amount"=>"0.00",
        "transaction_subject"=>"iPhone4, size: 6 $1",
        "payment_gross"=>"1.00",
        "shipping"=>"0.00",
        "ipn_track_id"=>"bcc0d508f0bfb",
        "action"=>"callback",
        "controller"=>"posts",
        "id"=>"4-apple-iphone4"
      }
    end

    it 'should build a payment object with the valid keys' do
      pair = FactoryGirl.create(:post)
      valid_params = callback_params.merge(id: pair.id.to_s)
      PaypalCallback.any_instance.stub(:trigger_status_change).and_return(true)
      post :callback, valid_params

      expect( assigns(:paypay).persisted? ).to eq true
    end
  end
end
 
