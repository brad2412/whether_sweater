class GeocodingService
  def self.get_location(location)
    get_url("address?location=#{location}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/" ) do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end

