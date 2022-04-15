module Public::CartItemsHelper

  def subtotal(cart_item)
    cart_item.item.with_tax_price * cart_item.item_count
  end

  def total_price(cart_items)
    total_price = 0
    cart_items.each do |cart_item|
      total_price += subtotal(cart_item)
    end
    return total_price
  end
end
