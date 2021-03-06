Rails.application.routes.draw do



  get 'password_resets/new'

  get 'password_resets/edit'

  # #Root
  # root 'static_pages#home'
  #
  # #Static pages
  # get 'help' => 'static_pages#help'
  # get 'about' => 'static_pages#about'
  # get 'contact' => 'static_pages#contact'
  #
  # #Users pages
  # get 'signup' => 'users#new'
  #
  # #Login/Logout
  #
  # get 'login' => 'sessions#new'
  # post 'login' => 'sessions#create'
  # delete 'logout' => 'sessions#destroy'

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  #Ressources
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
