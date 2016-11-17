Rails.application.routes.draw do
  #Root
  root 'static_pages#home'

  #Static pages
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  #Users pages
  get 'signup' => 'users#new'

  #Ressources
  resources :users
end
