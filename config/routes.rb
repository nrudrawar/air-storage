Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :storage_spaces do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    resources :reviews, only: :create
  end

  resources :reviews, only: :destroy
  get '/my_spaces', to: "storage_spaces#my_spaces", as: "my_spaces"

  get '/my_bookings', to: "bookings#my_bookings", as: "my_bookings"
end
