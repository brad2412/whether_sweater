Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'

      get '/munchies', to: 'yelp_search#index'
    end
  end
end
