class Api::V1::YelpSearchController < ApplicationController
  def index
    geocoding_facade = GeocodingFacade.new
    forecast_facade = ForecastFacade.new
    yelp_facade = YelpFacade.new
    geocoding_params = params[:location]
    food = params[:food]
    location = geocoding_facade.receive_lat_lng(geocoding_params)
    lat = location.lat
    lng = location.lng
    forecast = forecast_facade.receive_forecast(lat, lng)

    yelp_data = yelp_facade.receive_yelp_search(location, food)
    render_yelp_response(location, forecast, yelp_data.restaurant)
  end

  private

  def render_error(message)
    render json: { error: message }, status: :bad_request
  end

  def yelp_response(destination_city, forecast, restaurant)
    yelp_response_data = {
      data: {
        id: nil,
        type: 'munchie', 
        attributes: {
          destination_city: destination_city,
          forecast: forecast_response(forecast),
          restaurant: restaurant_response(restaurant)
        }
      }
    }
    render json: yelp_response_data
  end

  def forcast_response(forcast)
    {
            summary: forecast[:current_weather][:condition],
            temperature: "#{forecast[:current_weather][:temp_f].to_i} F"
          }
  end

  def restaurant_response(restaurant)
    {
      name: restaurant[:name],
      address: restaurant[:address],
      rating: restaurant[:rating],
      reviews: restaurant[:reviews]
    }
  end
end