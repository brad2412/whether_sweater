class Geocoding
  attr_reader :lat, :lng

  def initialize(attributes)
    if attributes && attributes[:results] && attributes[:results][0] && attributes[:results][0][:locations] && attributes[:results][0][:locations][0]
      @lat = attributes[:results][0][:locations][0][:latLng][:lat]
      @lng = attributes[:results][0][:locations][0][:latLng][:lng]
    else
      @lat = nil
      @lng = nil
    end
  end
end
