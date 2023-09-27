require "rails_helper"

RSpec.describe "UsersController", type: :request do
  describe "#create User" do
    before(:each) do
      User.destroy_all
      @headers = { 'CONTENT_TYPE' => 'application/json' }
    end

    context 'when creating a user' do
      it 'returns a new user with valid parameters' do
        user_params = {
            email: "123email@email.com",
            password: "password123",
            password_confirmation: "password123"
        }
        post "/api/v0/users", params: user_params.to_json, headers: @headers

        expect(response).to be_successful
        expect(response.status).to eq(201)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed.keys).to eq([:data])

        expect(parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed[:data][:id].to_i).to be_an(Integer)
        expect(parsed[:data][:type]).to eq("users")

        expect(parsed[:data][:attributes]).to be_a(Hash)
        expect(parsed[:data][:attributes][:email]).to eq("123email@email.com")
        expect(parsed[:data][:attributes][:api_key]).to be_a(String)
        expect(parsed[:data][:attributes][:password]).to be_nil
      end

      it 'returns errors for an existing user' do
        user_params = {
            email: "123email@email.com",
            password: "password123",
            password_confirmation: "password123"
          }
        User.create!(user_params)

        post "/api/v0/users", params: user_params.to_json, headers: @headers

        expect(response.status).to eq(400)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:errors]).to eq(["Email has already been taken"])
      end

      it 'returns errors for unmatched passwords' do
        user_params = {
            email: "123email@email.com",
            password: "password123",
            password_confirmation: "password"
          }
        post "/api/v0/users", params: user_params.to_json, headers: @headers

        expect(response.status).to eq(400)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:errors]).to eq(["Password confirmation doesn't match Password"])
      end

      it 'returns errors for missing email' do
        user_params = {
            email: "",
            password: "password123",
            password_confirmation: "password123"
          }


        post "/api/v0/users", params: user_params.to_json, headers: @headers

        expect(response.status).to eq(400)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:errors].first).to eq("Email can't be blank")
      end

      it 'returns errors for missing password' do
        user_params = {
          
            email: "123email@email.com",
            password: "",
            password_confirmation: ""
          }

        post "/api/v0/users", params: user_params.to_json, headers: @headers

        expect(response.status).to eq(400)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed[:errors].first).to eq("Password can't be blank")
      end
    end
  end
end

