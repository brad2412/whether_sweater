require "rails_helper"

RSpec.describe "ForecastFacade" do
  describe "#receive_forecast" do
    it "gets forecast using latitude and longitude" do
      lat = "39.52766"
      lng = "-119.81353"

      forecast_facade = ForecastFacade.new
      receive_forecast = forecast_facade.receive_forecast(lat, lng)

      expect(receive_forecast).to be_a(Forecast)
      expect(receive_forecast.current_weather).to be_a(Hash)
      expect(receive_forecast.daily_weather).to be_an(Array)
      expect(receive_forecast.hourly_weather).to be_an(Array)
    end
  end
end