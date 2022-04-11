class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

  def total_price
    total_price = 0
    cart_items.each do |cart_item|
      total_price += cart_item.subtotal
    end
    return total_price
  end

end
