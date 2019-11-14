class CreateFoodControls < ActiveRecord::Migration[5.2]
  def change
    create_table :food_controls do |t|
      t.references :user, foreign_key: true,type: :string
      t.references :food, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :delete_flg
    end
  end
end
