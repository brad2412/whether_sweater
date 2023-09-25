Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'

      get 'book_search', to: 'book#index'
    end
  end
end
