Rails.application.routes.draw do
  resources :profiles

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  resources :flats, only: [ :new, :create, :show, :edit, :update, :destroy, :index] do
    resources :bookings, only: [ :new, :show, :create, :destroy]
  end
  get 'bookings', to: 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
