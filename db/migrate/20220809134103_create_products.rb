class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.binary :status
      t.references :category
     

      t.timestamps
    end
  end
end
