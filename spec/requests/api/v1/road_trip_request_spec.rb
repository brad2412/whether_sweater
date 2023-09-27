require "rails_helper"

RSpec.describe "RoadTripController", type: :request do
  describe "POST /api/v0/road_trip" do
    before(:each) do
      User.destroy_all
      @headers = { "CONTENT_TYPE" => "application/json" }
      @user = User.create!(email: "test@example.com", password: "password123", password_confirmation: "password123")
    end

    context "when requesting a road trip with a valid API key" do
      it "returns the road trip data and a 201 status code" do
        road_trip_params = {
          origin: "Denver, CO",
          destination: "Boulder, CO",
          api_key: @user.api_key
        }

        post "/api/v0/road_trip", headers: @headers, params: road_trip_params.to_json
        # require 'pry'; binding.pry
        expect(response.status).to eq(201)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed.keys).to eq([:data])

        expect(parsed[:data].keys).to eq([:id, :type, :travel_time, :attributes])
        expect(parsed[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
      end
    end

    context "when requesting a road trip with an invalid API key" do
      it "returns an error message and a 401 status code" do
        road_trip_params = {
          origin: "Denver, CO",
          destination: "Boulder, CO",
          api_key: "invalid_key"
        }

        post "/api/v0/road_trip", params: road_trip_params.to_json, headers: @headers

        expect(response.status).to eq(401)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed.keys).to eq([:error])
        expect(parsed[:error]).to eq("Invalid API key")
      end
    end
  end
end
