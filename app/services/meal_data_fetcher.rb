class MealDataFetcher
  def self.fetch_and_update_meal_data(meal)
    return meal if meal.data_complete?

    meal_data = lookup_meal(meal.external_id)

    meal.update(
      instructions: meal_data.instructions,
      ingredients: meal_data.ingredients
    )

    meal
  end

  # possibly slowing down the app, but best I could do for now
  # ideally, I'd launch an async request to fetch it on the show meals page
  def self.lookup_meal(external_id)
    MealDbClient.new.lookup(meal_id: external_id)
  end
end
