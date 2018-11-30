Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      patch "/purchase_horse", to: "players#buy_horse"
      resources :players, only: [:show] do
        patch "/horses/:horse_id/toggle_for_sale", to: "horses#toggle_for_sale"
      end
    end
  end
end
