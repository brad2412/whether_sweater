require "rails_helper"

RSpec.describe "Geocoding Facade" do
  describe "#receive_lat_lng" do
    it "gets latitude and longitude using location" do
      location = "Reno, NV"

      geocoding_facade = GeocodingFacade.new
      receive_location = geocoding_facade.receive_lat_lng(location)

      expect(receive_location).to be_a(Geocoding)

      expect(receive_location.lat).to eq(39.52766)
      expect(receive_location.lng).to eq(-119.81353)
    end
  end
end