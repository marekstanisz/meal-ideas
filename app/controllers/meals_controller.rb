class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def random
    @meal = MealPresenter.new(fetch_random_meal)
  end

  private

  def random_meal
    @random_meal ||= MealDataFetcher.fetch_meal_data(
      MealQuery.random_meal
    )
  end
end
