class RemoveColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :ingredients, :quantity
  end

  def down
    add_column :ingredients, :quantity, :float
  end 
end
