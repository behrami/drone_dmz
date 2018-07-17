Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home, only: %i[index]
  resources :bookings, only:  %i[show new create]
  resource :session, only: %i[new create destroy] do
    resources :bookings, only:  %i[index destroy]
  end
end
