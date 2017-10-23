Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurants#index'

  resources :restaurants do
    resources :reservations, only: %i(create)
  end

  resources :users, only: %i(create new) do
    resources :reservations, only: %i(create)
  end

  resources :sessions, only: %i(create new destroy)

end
