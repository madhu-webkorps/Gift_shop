class Cart < ApplicationRecord
    has_many :cart_products, dependent: :destroy
    has_many :products, through: :cart_products

    def sub_total
      sum = 0
      self.cart_products.each do |line_item|
        sum+= line_item.total_price
      end
      return sum
    end
end
