require "rails_helper"

RSpec.describe Forecast do
  describe "#initialize" do
    it "creates a new forecast with current, daily, and hourly weather data" do
      attributes = {
        current: {
          last_updated: "2023-09-23 12:00:00",
          temp_f: 72.5,
          feelslike_f: 75.0,
          humidity: 60,
          uv: 5,
          vis_miles: 10.0,
          condition: {
            text: "Partly cloudy",
            icon: "icon_url"
          }
        },
        forecast: {
          forecastday: [
            {
              date: "2023-09-23",
              astro: {
                sunrise: "06:30 AM",
                sunset: "07:30 PM"
              },
              day: {
                maxtemp_f: 75.0,
                mintemp_f: 68.0,
                condition: {
                  text: "Sunny",
                  icon: "sunny_icon_url"
                }
              },
              hour: [
                {
                  time: "2023-09-23 12:00:00",
                  temp_f: 72.5,
                  condition: {
                    text: "Partly cloudy",
                    icon: "icon_url"
                  }
                }
              ]
            }
          ]
        }
      }

      forecast = Forecast.new(attributes)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.daily_weather).to be_an(Array)
      expect(forecast.hourly_weather).to be_an(Array)
      expect(forecast.current_weather[:last_updated]).to eq(attributes[:current][:last_updated])
      expect(forecast.daily_weather[0][:date]).to eq(attributes[:forecast][:forecastday][0][:date])
      expect(forecast.hourly_weather[0][:time]).to eq(attributes[:forecast][:forecastday][0][:hour][0][:time])
    end
  end
end
