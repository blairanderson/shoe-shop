class AddStuffToPaypalCallback < ActiveRecord::Migration
  def change
    add_column :paypal_callbacks, :payment_date,    :datetime 
    add_column :paypal_callbacks, :payment_type,    :string
    add_column :paypal_callbacks, :payment_status,  :string
    add_column :paypal_callbacks, :payer_status,    :string
    add_column :paypal_callbacks, :payer_id,        :string
    add_column :paypal_callbacks, :payer_email,     :string 
    add_column :paypal_callbacks, :payment_fee,     :string 
    add_column :paypal_callbacks, :payment_gross,   :string 
    add_column :paypal_callbacks, :handling_amount, :string 
    add_column :paypal_callbacks, :shipping,        :string 
    add_column :paypal_callbacks, :first_name,      :string
    add_column :paypal_callbacks, :last_name,       :string 
    add_column :paypal_callbacks, :address_name,    :string 
    add_column :paypal_callbacks, :address_status,  :string 
    add_column :paypal_callbacks, :address_street,  :string 
    add_column :paypal_callbacks, :address_city,    :string 
    add_column :paypal_callbacks, :address_state,   :string 
    add_column :paypal_callbacks, :address_zip,     :string 
    add_column :paypal_callbacks, :address_country_code, :string 
    add_column :paypal_callbacks, :address_country, :string 
    add_column :paypal_callbacks, :transaction_subject, :string 
    add_column :paypal_callbacks, :receiver_email,  :string 
    add_column :paypal_callbacks, :receiver_id,   :string 
    add_column :paypal_callbacks, :business,  :string 
    add_column :paypal_callbacks, :protection_eligibility,  :string 
    add_column :paypal_callbacks, :verify_sign,   :string 
    add_column :paypal_callbacks, :ipn_track_id,  :string 
    add_column :paypal_callbacks, :txn_id,  :string 
    add_column :paypal_callbacks, :txn_type,  :string 
    add_column :paypal_callbacks, :residence_country, :string 
  end
end
