class Yelp
  attr_reader :destination_city, :forecast, :restaurant

  def initialize(data)
    @destination_city = data[:destination_city]
    @forecast = forecast_data(data[:forecast])
    @restaurant = restaurant_data(data[:restaurant])
  end

  private

  def forecast_data(forecast)
    {
      summary: forecast[:summary],
      temperature: forecast[:temperature]
    }
  end

  def restaurant_data(restaurant)
    {
      name: restaurant[:name],
      address: restaurant[:address],
      rating: restaurant[:rating],
      reviews: restaurant[:reviews]
    }
  end
end
