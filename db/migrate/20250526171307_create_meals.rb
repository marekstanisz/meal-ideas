class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.references :category, null: false, foreign_key: { to_table: "meal_categories" }
      t.string :image_url
      t.string :external_id
      t.string :external_service

      t.timestamps
    end
  end
end
