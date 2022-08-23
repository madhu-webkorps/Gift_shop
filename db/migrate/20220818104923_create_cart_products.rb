class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|
      t.references :product
      t.references :order
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
