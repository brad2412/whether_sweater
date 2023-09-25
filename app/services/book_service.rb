class BookService
  def self.search_books(location, quantity)
    get_url("api/books?bibkeys=ISBN:#{location}&format=json")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://openlibrary.org/")
  end
end
