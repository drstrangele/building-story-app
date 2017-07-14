Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "buildings#index"

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup' => 'users#new'
  resources :users, only: [:new]

  resources :users do
    resources :stories, only: :show
  end

  resources :buildings do
    resources :stories do
      resources :photos
    end
  end

end
