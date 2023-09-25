class Api::V1::BookSearchController < ApplicationController
  def index
    geocoding_params = params[:location]
    geocoding_facade = GeocodingFacade.new
    forecast_facade = ForecastFacade.new
    location = geocoding_facade.receive_lat_lng(geocoding_params)
    lat = location.lat
    lng = location.lng
    forecast = forecast_facade.receive_forecast(lat, lng)
    quantity = params[:quantity].to_i
    books_location = params[:location]
    books = BookFacade.search_books(books_location, quantity)
    render json: BooksSerializer.new(books)
  end
end



