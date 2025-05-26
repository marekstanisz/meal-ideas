class AddIngredientsToMeals < ActiveRecord::Migration[8.0]
  def change
    add_column :meals, :ingredients, :jsonb
  end
end
