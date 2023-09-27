require "rails_helper"

RSpec.describe "Sessions Controller", type: :request do
  describe "POST /api/v0/sessions" do
    before(:each) do
      User.destroy_all
      @headers = { "CONTENT_TYPE" => "application/json" }
    end

    context "when logging in with valid credentials" do
      it "returns the user data and a 200 status code" do
        user_params = {
          email: "user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
        User.create!(user_params)

        login_params = {
          email: "user@example.com",
          password: "password123"
        }

        post "/api/v0/sessions", params: login_params.to_json, headers: @headers

        expect(response.status).to eq(200)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed.keys).to eq([:data])

        expect(parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed[:data][:id].to_i).to be_an(Integer)
        expect(parsed[:data][:type]).to eq("users")

        expect(parsed[:data][:attributes]).to be_a(Hash)
        expect(parsed[:data][:attributes][:email]).to eq("user@example.com")
        expect(parsed[:data][:attributes][:api_key]).to be_a(String)
        expect(parsed[:data][:attributes][:password]).to be_nil
      end
    end

    context "when logging in with invalid credentials" do
      it "returns an error message and a 400 status code" do
        user_params = {
          email: "user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
        User.create!(user_params)

        login_params = {
          email: "user@example.com",
          password: "incorrect_password"
        }

        post "/api/v0/sessions", params: login_params.to_json, headers: @headers

        expect(response.status).to eq(400)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed.keys).to eq([:errors])
        expect(parsed[:errors]).to eq("Login information is incorrect.")
      end
    end
  end
end
