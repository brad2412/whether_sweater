class RoadTripService
  def self.get_directions(origin, destination)
    directions = get_url("/directions/v2/route?from=#{origin}&to=#{destination}")
    directions[:route][:formattedTime]
  end

  def self.get_location_data(location_name)
    location_data = get_url("/geocoding/v1/address?location=#{location_name}")
    location_data.dig(:results, 0, :locations, 0, :latLng)
  end
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.conn
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end