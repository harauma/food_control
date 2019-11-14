class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.references :category, foreign_key: true
      t.string :food_name, :null => false, :limit => 30
      t.integer :day, :null => false
    end
  end
end
