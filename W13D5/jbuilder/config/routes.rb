Rails.application.routes.draw do
  # Your routes here!
  namespace :api, defaults: { format: :json } do
    resources :guests do
      resources :gifts, only: [:index]
    end
    resources :gifts, only: [:show, :index]
    resources :parties, only: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
