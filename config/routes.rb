Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :challenges, only: %i[show index new create destroy edit update] do
    # resources :reviews, only: %i[new create]
    resources :bookings, only: %i[create update] do
      member do
        get :review
      end
    end
  end
  resources :bookings, only: %i[destroy]
  # resources :reviews, only: %i[edit update destroy]
  get '/my_challenges', action: :index, controller: 'challenges'
  get '/my_bookings', action: :index, controller: 'bookings'
end
