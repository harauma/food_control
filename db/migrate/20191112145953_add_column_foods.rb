class AddColumnFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :food_delete_flg, :integer
  end
end
