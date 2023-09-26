# require 'rails_helper'

# RSpec.describe 'YelpFacade', type: :facade do
#   context 'instance methods' do
#     scenario 'receive_yelp_search' do
#       location = 'denver,co'
#       food = '5'

#       allow(YelpService).to receive(:get_location).with(location, food).and_return(yelp_search_result)

#       yelp_data = YelpFacade.new.receive_yelp_search(location, food)

#       expect(yelp_data).to be_a(Yelp)
#     end
#   end
# end
