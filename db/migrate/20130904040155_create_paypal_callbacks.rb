class CreatePaypalCallbacks < ActiveRecord::Migration
  def change
    create_table :paypal_callbacks do |t|
      t.text :response
      t.integer :post_id

      t.timestamps
    end
  end
end
