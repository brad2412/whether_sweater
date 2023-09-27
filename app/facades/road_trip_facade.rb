class RoadTripFacade
  def self.create_road_trip(origin, destination_name)
    destination_coordinates = RoadTripService.get_location_data(destination_name)

    return nil unless destination_coordinates

    travel_time = RoadTripService.get_directions(origin, destination_name)
    forecast = ForecastService.get_forecast(destination_coordinates[:lat], destination_coordinates[:lng])

    RoadTrip.new(origin, destination_name, travel_time, forecast)
  end
end
