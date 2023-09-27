class GeocodingFacade
  def receive_lat_lng(location)
    geocoding_details = GeocodingService.get_location(location)
    Geocoding.new(geocoding_details)
  end
end
