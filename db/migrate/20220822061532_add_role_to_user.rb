class AddRoleToUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role, :integer , default: 0
    # change_column :table_name, :column_name, :new_type
   
  end
  def down 
  end
end
