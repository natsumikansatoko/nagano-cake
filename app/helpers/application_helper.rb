module ApplicationHelper
  def full_name(customer)
    customer.last_name + customer.first_name
  end

  def sub_price(sub)
    sub.ite.with_tax_price * sub.amount
  end
  
  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end
end
