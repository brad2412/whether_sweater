require "rails_helper"

RSpec.describe Geocoding do
  describe "#initialize" do
    context "when valid attributes are provided" do
      it "creates a new Geocoding object with latitude and longitude" do
        attributes = {
          results: [
            {
              locations: [
                {
                  latLng: {
                    lat: 39.52766,
                    lng: -119.81353
                  }
                }
              ]
            }
          ]
        }

        geocoding = Geocoding.new(attributes)


        expect(geocoding).to be_a(Geocoding)
        expect(geocoding.lat).to eq(39.52766)
        expect(geocoding.lng).to eq(-119.81353)
      end
    end

    context "when invalid attributes are provided" do
      it "creates a new Geocoding object with nil latitude and longitude" do

        invalid_attributes = {}

        geocoding = Geocoding.new(invalid_attributes)

        expect(geocoding).to be_a(Geocoding)
        expect(geocoding.lat).to be_nil
        expect(geocoding.lng).to be_nil
      end
    end
  end
end
