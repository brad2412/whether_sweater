class YelpService
  def self.get_location(location, food)
    get_url("businesses/search.json?q=#{location}&term=#{food}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.yelp.com/v3" ) do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
    end
  end
end