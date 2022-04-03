class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :order_status
      t.integer :shipping_fee, defalt: "800"
      t.integer :amount_billed
      t.integer :payment_method

      t.timestamps
    end
  end
end
