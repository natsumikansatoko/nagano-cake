class RenameItemCountColumToOrderItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_items, :item_count, :amount
  end
end
