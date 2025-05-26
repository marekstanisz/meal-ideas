class MealPresenter
  delegate :id, :external_id, :name, :instructions, to: :meal

  def initialize(meal)
    @meal = meal
  end

  def ingredients
    @ingredients ||= meal.ingredients.to_a.map do |ingredient_data|
      ingredient_data.join(" - ")
    end
  end

  attr_reader :meal
end
