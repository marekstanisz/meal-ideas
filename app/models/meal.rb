class Meal < ApplicationRecord
  belongs_to :category, class_name: "MealCategory", foreign_key: "category_id"
end
