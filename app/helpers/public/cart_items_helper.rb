module Public::CartItemsHelper
  def sub_price(sub)
    sub.item.with_tax_price * sub.amount
  end
end
