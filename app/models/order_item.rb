class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :item_id, :order_id, :amount, :ordered_price, presence: true
  validates :ordered_price, :amount, numericality: { only_integer: true }

  enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

end
