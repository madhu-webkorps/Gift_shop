class AddCartIdToCartProducts < ActiveRecord::Migration[6.1]
  def change
    # add_column :cart_products, :cart_id, :integer r
    add_reference :cart_products, :cart, index: true
  end
end
