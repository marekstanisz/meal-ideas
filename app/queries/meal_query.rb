class MealQuery
  def initialize(scope = Meal.all)
    @scope = scope
  end

  def random_meal
    scope.order(Arel.sql("RANDOM()")).first
  end

  def self.random_meal
    new.random_meal
  end

  private

  attr_reader :scope
end
