module Admin::OrdersHelper
  def sub_price(sub)
    sub.item.with_tax_price * sub.item_count
  end
end
