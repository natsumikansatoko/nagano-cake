class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, :item_id, :amount, presesnce: true
  validates :amount, numericality: { only_integer: true }
end
