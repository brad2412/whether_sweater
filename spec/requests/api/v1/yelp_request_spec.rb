require 'rails_helper'

RSpec.describe Yelp, type: :model do
  it 'has attributes' do
    data = {
      destination_city: 'Denver, CO',
      forecast: {
        summary: 'Sunny',
        temperature: '75 F'
      },
      restaurant: {
        name: 'Sample Restaurant',
        address: '123 Main St, Denver, CO',
        rating: 4.5,
        reviews: 100
      }
    }

    yelp = Yelp.new(data)

    expect(yelp.destination_city).to eq('Denver, CO')
    expect(yelp.forecast).to eq({
      summary: 'Sunny',
      temperature: '75 F'
    })
    expect(yelp.restaurant).to eq({
      name: 'Sample Restaurant',
      address: '123 Main St, Denver, CO',
      rating: 4.5,
      reviews: 100
    })
    expect(yelp).to be_a(Yelp)
  end
end