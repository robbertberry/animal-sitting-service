Rails.application.routes.draw do
  devise_for :users

  resources :bookings, only: [:index, :new, :create]

  root 'bookings#new'
end
