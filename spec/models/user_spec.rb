require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  describe "makes an api key for users" do
    it "#create_api_key" do
      user = User.new(
                      email: "user@example.com",
                      password: "password123",
                      password_confirmation: "password123"
                      )

      expect(user.send(:create_api_key)).to be_a(String)
    end
  end
end