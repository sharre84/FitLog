Rails.application.routes.draw do

  root 'users#index'
  resources :users
  resources :sessions, only: [:new, :create]
  resources :workouts do
    resources :exercises
  end

  delete '/logout' => 'sessions#destroy', as: :logout

end
