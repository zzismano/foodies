class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :restaurant
      t.references :user, null: false, foreign_key: true
      t.string :caption
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
