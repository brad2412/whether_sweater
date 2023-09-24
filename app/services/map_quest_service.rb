class MapQuestService
  
  def self.get_collections
    get_url("/v1/sets")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.magicthegathering.io" )
  end
end