Rails.application.routes.draw do
  resources :profiles

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  resources :flats, only: [ :new, :create, :show, :edit, :update, :destroy, :index] do
    resources :bookings, only: [ :new, :create, :destroy, :index] do
      member do
        patch "approve", to:"bookings#approve"
        patch "decline", to:"bookings#decline"
        patch "cancel", to:"bookings#cancel"
      end
    end
  end
  get 'bookings', to: 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
