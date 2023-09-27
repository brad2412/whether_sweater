class RoadTrip
  attr_reader :id, :type, :attributes

  def initialize(origin, destination, travel_time, forecast)
    @id = nil
    @type = "road_trip"
    @travel_time = format_travel_time(travel_time)
    @attributes = {
      start_city: origin,
      end_city: destination,
      travel_time: @travel_time,
      weather_at_eta: calculate_weather_at_eta(forecast)
    }
  end

  private

  def format_travel_time(time)
    return 'impossible route' if time.nil? || time == 'impossible'

    parts = time.split(':').map(&:to_i)
    formatted = []
    formatted << "#{parts[0]} hours" if parts[0] > 0
    formatted << "#{parts[1]} minutes" if parts[1] > 0
    formatted << "#{parts[2]} seconds" if parts[2] > 0

    formatted.join(', ')
  end

  def calculate_weather_at_eta(forecast)
    return {} if @travel_time == 'impossible route'
    
    arrival_time = Time.now + @travel_time.to_i.seconds
    find_weather_for_time(arrival_time, forecast)
  end

  def find_weather_for_time(time, forecast)
    time_in_chicago = time.in_time_zone('America/Chicago').change(min: 0) # Change the minute to 0, effectively rounding down
  
    if time_in_chicago - Time.now.in_time_zone('America/Chicago') <= 24*3600
      hour = time_in_chicago.strftime('%H:%M')
        
      hourly_forecast = forecast[:forecast][:forecastday][0][:hour].find { |h| Time.parse(h[:time]).strftime('%H:%M') == hour }
        
      if hourly_forecast
        {
          time: hourly_forecast[:time],
          temp_f: hourly_forecast[:temp_f],
          condition: hourly_forecast[:condition][:text]
        }
      else
        nil
      end
    else
      date = time_in_chicago.strftime('%Y-%m-%d')
      daily_forecast = forecast[:forecast][:forecastday].find { |d| d[:date] == date }[:day]
        
      {
        time: date,
        temp_f: daily_forecast[:maxtemp_f],
        condition: daily_forecast[:condition][:text]
      }
    end
  end
end

