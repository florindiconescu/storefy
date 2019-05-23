Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_storages', to: 'storages#my_storages'
  patch '/bookings/:id/approved', to: 'bookings#approved', as: 'approved'
  patch '/bookings/:id/denied', to: 'bookings#denied', as: 'denied'
  resources :storages do
    resources :bookings, only: [:new, :create]
    resources :photos, only: [:create, :index]
  end
  resources :photos, only: [:destroy]
  resources :bookings, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
