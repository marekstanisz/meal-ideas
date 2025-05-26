class MealDataFetcher
  def self.fetch_and_update_meal_data(meal)
    return meal if meal.data_complete?

    meal_data = MealDb::Meal.new(
      lookup_meal(meal.external_id)
    )

    meal.update(
      instructions: meal_data.instructions,
      ingredients: meal_data.ingredients
    )

    meal
  end

  def self.lookup_meal(external_id)
    MealDbClient.new.lookup(meal_id: external_id)["meals"].first
  end
end
