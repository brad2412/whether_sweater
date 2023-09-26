class YelpFacade
  def receive_yelp_search(location, food)
    yelp_search = YelpService.get_location(location, food)
    Yelp.new(yelp_search)
  end
end