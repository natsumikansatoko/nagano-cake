class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sub_price(sub)
    sub.item.with_tax_price * sub.amount
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end

end
