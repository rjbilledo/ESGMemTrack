Rails.application.routes.draw do
  resources :classifications
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    infos: 'users/infos'
  }
  resources :users
  resources :attendances
  resources :events
  resources :members
  resources :pages
  resources :tests
 # root 'attendances#index'

  resources :members do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
