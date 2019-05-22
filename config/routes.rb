Rails.application.routes.draw do
  get 'photos/index'
  get 'photos/create'
  get 'photos/destroy'
  devise_for :users
  root to: 'pages#home'
  get '/my_storages', to: 'storages#my_storages'
  resources :storages do
    resources :bookings, only: [:new, :create]
    resources :photos, only: [:create, :index]
  end
  resources :photos, only: [:destroy]
  resources :bookings, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
