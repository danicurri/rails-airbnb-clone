Rails.application.routes.draw do


  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
  	resources :profiles, only: [ :show, :edit, :update, :destroy ]
  end
  root to: 'pages#home'
  resources :flats, only: [ :new, :create, :show, :edit, :update, :destroy, :index] do
    resources :bookings, only: [ :new, :show, :create, :destroy]
  end
  get 'bookings', to: 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
