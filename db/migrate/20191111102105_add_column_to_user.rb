class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_delete_flg, :integer
  end
end
