Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      patch "/purchase_horse", to: "players#buy_horse"
      post '/login', to: 'auth#create'
      get '/player', to: 'players#show'

      resources :players, only: [:show, :create] do
        post '/profile', to: 'players#profile'
        patch "/horses/:horse_id/toggle_for_sale", to: "horses#toggle_for_sale"
      end
      resources :horses, only: [:update]
    end
  end
end
