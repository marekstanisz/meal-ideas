module MealDb
  class Meal
    def initialize(meal_data)
      @meal_data = meal_data
    end

    def instructions
      @instructions ||= meal_data["strInstructions"]
    end

    def ingredients
      @ingredients ||= 20.times.each_with_object({}) do |index, hash|
        ingredient = meal_data["strIngredient#{index + 1}"]
        measure = meal_data["strMeasure#{index + 1}"]

        break hash if ingredient.blank?

        hash[ingredient] = measure.to_s.strip
      end
    end

    private

    attr_reader :meal_data
  end
end
