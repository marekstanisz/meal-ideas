# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed categories
MealDbClient.new.list(kind: "c")["meals"].each do |category|
  MealCategory.find_or_create_by!(name: category["strCategory"])
end

# Seed meals by category
MealCategory.find_each do |category|
  meals = MealDbClient.new.filter_by(category: category.name)["meals"]
  next if meals.blank?

  meals.each do |meal|
    Meal.find_or_create_by!(name: meal["strMeal"], category: category) do |m|
      m.image_url = meal["strMealThumb"]
      m.external_id = meal["idMeal"]
      m.external_service = "meal_db"
    end
  end
end
