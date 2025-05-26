class MealDbClient
  MEAL_DB_API_URL = "https://themealdb.com/api/json/v1/"
  MEAL_DB_API_KEY = "1" # ideally, it would have been loaded from ENV or via secrets

  def lookup(meal_id:)
    perform_request("lookup.php", params: { i: meal_id })
  end

  def random
    perform_request("random.php")
  end

  # a for list of areas
  # c for list of categories
  # i for list of ingredients
  def list(kind:)
    params = { kind => "list" }
    perform_request("list.php", params:)
  end

  def filter_by(ingredient: nil, category: nil, area: nil)
    params = { i: ingredient, c: category, a: area }.compact
    perform_request("filter.php", params:)
  end

  private

  def perform_request(endpoint, params:)
    response = connection.get(endpoint, params)

    return {} if response.body.blank?
    JSON.parse(response.body)
  end

  def connection
    @connection ||= Faraday.new(url: MEAL_DB_API_URL + MEAL_DB_API_KEY) do |config|
      config.response(:raise_error)
    end
  end
end
