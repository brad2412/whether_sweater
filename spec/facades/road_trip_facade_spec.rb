require "rails_helper"

RSpec.describe "RoadTripFacade" do
  describe ".create_road_trip" do
    it "creates a road trip using origin and destination name", :vcr do
      origin = "Denver, CO"
      destination = "Boulder, CO"

      road_trip = RoadTripFacade.create_road_trip(origin, destination)

      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.attributes[:start_city]).to eq(origin)
      expect(road_trip.attributes[:end_city]).to eq(destination)
      expect(road_trip.attributes[:travel_time]).to be_a(String)
      expect(road_trip.attributes[:weather_at_eta]).to be_a(Hash)
      expect(road_trip.attributes[:weather_at_eta][:time]).to be_a(String)
      expect(road_trip.attributes[:weather_at_eta][:temp_f]).to be_a(Float)
      expect(road_trip.attributes[:weather_at_eta][:condition]).to be_a(String)
      # expect(road_trip.attributes[:weather_at_eta][:condition][:text]).to be_an(String)
    end
  end
end
