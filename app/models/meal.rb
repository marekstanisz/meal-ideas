class Meal < ApplicationRecord
  belongs_to :category, class_name: "MealCategory", foreign_key: "category_id"

  def data_complete?
    ingredients.present? && instructions.present?
  end
end
