Rails.application.routes.draw do
  # get 'bookings/index'

  # get 'bookings/new'

  # get 'bookings/create'

  # get 'bookings/edit'

  # get 'bookings/show'

  # get 'bookings/update'

  # get 'bookings/destroy'

  # get 'flats/new'

  devise_for :users
  root to: 'pages#home'
  resources :flats, only: [ :new, :create, :show, :edit, :update, :destroy, :index] do
    resources :bookings, only: [ :new, :show, :create, :destroy]
  end
  get 'bookings', to: 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
