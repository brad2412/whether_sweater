class GeocodingFacade
  def receive_lat_lng(location)
    geocoding_details = GeocodingService.get_location(location) # Update this line
    Geocoding.new(geocoding_details)
  end
end
