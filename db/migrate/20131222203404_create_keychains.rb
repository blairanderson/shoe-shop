class CreateKeychains < ActiveRecord::Migration
  def change
    create_table :keychains do |t|
      t.string :api_secret
      t.string :api_token
      t.string :auth_credential_secret
      t.string :auth_credential_token
      t.integer :user_id

      t.timestamps
    end
  end
end
