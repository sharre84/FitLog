Rails.application.routes.draw do


  root 'users#index'
  resources :users
  resources :sessions, only: [:new, :create]
  resources :workouts

  delete '/logout' => 'sessions#destroy', as: :logout

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'
end
