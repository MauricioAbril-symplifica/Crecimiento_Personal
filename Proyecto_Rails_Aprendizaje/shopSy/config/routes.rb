Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #delete 'products/:id', to: 'products#destroy'
  #patch '/products/:id', to: 'products#update'
  #post '/products', to: 'products#create'
  #get '/products/new', to: 'products#new', as: :new_product
  #get '/products', to: 'products#index'
  #get 'products/:id', to:'products#show', as: :product
  #get 'products/:id/edit', to:'products#edit', as: :edit_product
  

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :categories, except: :show
  resources :products, path: '/'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
