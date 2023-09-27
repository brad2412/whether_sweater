Whether, Sweater?
Description

Whether, Sweater? is a back-end application designed for planning road trips. Users can view the current weather as well as the forecasted weather at their destination. This app is structured with a service-oriented architecture, providing an API to communicate with the front-end team.

Learning Goals

  Expose an API that aggregates data from multiple external APIs.
  Expose an API that requires an authentication token.
  Expose an API for CRUD functionality.
  Determine completion criteria based on the needs of other developers.
  Test both API consumption and exposure, using at least one mocking tool like VCR or Webmock.


Setup
Clone this repo by visitin this site:

  https://github.com/brad2412/whether_sweater

  click on the green CODE button shown below:
![Alt text](https://file%252B.vscode-resource.vscode-cdn.net/Users/bam/Desktop/Screenshot%25202023-09-27%2520at%25206.28.19%2520AM.png?version%253D1695821354574)


In the drop down menu there will be a github link that looks similar to the site link copy that link an image of what it should look like is below:

![Alt text](https://file%252B.vscode-resource.vscode-cdn.net/Users/bam/Desktop/Screenshot%25202023-09-27%2520at%25206.12.50%2520AM.png?version%253D1695821065958)


Once it has been cloned in your local machine please run the following commands:

    bundle install in your terminal
    rails db:{create,migrate} to set up the database.
    rails exec rspec - all test should be passing

* If you look in the DB file it should look like this:

![Screenshot 2023-09-27 at 6 09 48 AM](https://github.com/brad2412/whether_sweater/assets/125830592/927f9a77-f2c1-413a-935d-a8d89a3c570c)

Start the local server with rails s to test out the end points:

For external APIs, ensure you have your own API keys and set them up using Rails credentials.

Expected endpoints for what this App does and examples are below:

Retrieve Weather for a City

Request: GET /api/v0/forecast?location=cincinatti,oh
Response: Detailed weather information including current weather, daily weather, and hourly weather.

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

Lessons Learned
Throughout the development of this project, I delved deeply into the intricacies of CRUD functionality, especially in the context of creating and interacting with API endpoints. This journey was not without its challenges. Each obstacle faced was an opportunity to learn, adapt, and iterate on my solutions.

Finalizing the project, I feel a sense of accomplishment. The knowledge and experience gained, particularly about CRUD operations and API interactions, have been invaluable. It's rewarding to see everything come together and function harmoniously.

I'm excited to carry these learnings forward into future projects. If you have any questions or would like to discuss the project further, please don't hesitate to reach out.

Thank you for taking the time to explore this repository.


