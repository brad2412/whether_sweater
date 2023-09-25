class Api::V1::ForecastController < ApplicationController
  def index
    geocoding_params = params[:location]
    geocoding_facade = GeocodingFacade.new
    forecast_facade = ForecastFacade.new
    location = geocoding_facade.receive_lat_lng(geocoding_params)
    lat = location.lat
    lng = location.lng
    forecast = forecast_facade.receive_forecast(lat, lng)
    render json: ForecastSerializer.new(forecast)
  end
end