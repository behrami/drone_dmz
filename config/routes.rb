Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home, only: %i[index]
  resources :about_us, only: %i[index]
  resources :tos, only: %i[index]
  resources :patrons, only:  %i[show new create]
  resources :pilots, only:  %i[show new create]
  resource :session, only: %i[new create destroy] do
    resources :patrons, only:  %i[index destroy]
    resources :pilots, only:  %i[index destroy]
    resources :bookings, only:  %i[index show new create destroy]
  end
end
