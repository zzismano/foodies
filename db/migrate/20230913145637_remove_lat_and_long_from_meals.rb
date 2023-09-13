class RemoveLatAndLongFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_column :meals, :lat
    remove_column :meals, :long
  end
end
