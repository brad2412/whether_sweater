Whether, Sweater?
Table of Contents
Description
Learning Goals
Setup
Endpoints
Retrieve Weather for a City
User Registration
Login
Road Trip
Testing
Description
Whether, Sweater? is a back-end application designed for planning road trips. Users can view the current weather as well as the forecasted weather at their destination. This app is structured with a service-oriented architecture, providing an API to communicate with the front-end team.

Learning Goals
Expose an API that aggregates data from multiple external APIs.
Expose an API that requires an authentication token.
Expose an API for CRUD functionality.
Determine completion criteria based on the needs of other developers.
Test both API consumption and exposure, using at least one mocking tool like VCR or Webmock.
Setup
Clone this repo.
Run bundle install to install dependencies.
Execute rails db:{create,migrate} to set up the database.
Start the local server with rails s.
For external APIs, ensure you have your own API keys and set them up using Rails credentials.
Endpoints
Retrieve Weather for a City
Request: GET /api/v0/forecast?location=cincinatti,oh
Response: Detailed weather information including current weather, daily weather, and hourly weather.
* Database creation
![Screenshot 2023-09-27 at 6 09 48 AM](https://github.com/brad2412/whether_sweater/assets/125830592/927f9a77-f2c1-413a-935d-a8d89a3c570c)
User Registration
Request: POST /api/v0/users
Payload: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}
Response: A unique API key for the registered user.
Login
Request: POST /api/v0/sessions
Payload: {"email": "whatever@example.com", "password": "password"}
Response: The user's API key if authentication is successful.
Road Trip
Request: POST /api/v0/road_trip
Payload: {"origin": "Cincinatti,OH", "destination": "Chicago,IL", "api_key": "YOUR_API_KEY"}
Response: Road trip details, including starting city, ending city, travel time, and expected weather at ETA.
Testing
Run bundle exec rspec to run the test suite.
For mocked external API calls, tools like VCR or Webmock are utilized.
This README provides a high-level overview of your application. You can further elaborate on specific details, configurations, or usage examples as necessary.


