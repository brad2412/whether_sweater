require "rails_helper"

RSpec.describe RoadTrip do
  describe "#initialize" do
    it "creates a new road trip with start city, end city, travel time, and weather at ETA" do
      origin = "Cincinatti,OH"
      destination = "Chicago,IL"
      travel_time = "04:21:15"
      forecast = {
        :forecast => {
          :forecastday => [{
            :hour => [{
              :time => "2023-09-27 06:00",
              :temp_f => 64.0,
              :condition => {
                :text => "Partly cloudy"
              }
            }]
          }]
        }
      }

      road_trip = RoadTrip.new(origin, destination, travel_time, forecast)

      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.attributes[:start_city]).to eq(origin)
      expect(road_trip.attributes[:end_city]).to eq(destination)
      expect(road_trip.attributes[:travel_time]).to eq("4 hours, 21 minutes, 15 seconds")
      # expect(road_trip.attributes[:weather_at_eta][:time]).to eq("2023-09-27 06:00")
      # expect(road_trip.attributes[:weather_at_eta][:temp_f]).to eq(64.0)
      # expect(road_trip.attributes[:weather_at_eta][:condition][:text]).to eq("Partly cloudy")
    end
  end
end
