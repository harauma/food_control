class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :string do |t|
      t.string :user_name, :null => false, :limit => 20
      t.string :password, :null => false, :limit => 20
    end
  end
end
