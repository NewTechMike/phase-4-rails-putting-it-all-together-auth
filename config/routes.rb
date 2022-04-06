Rails.application.routes.draw do
  resources :recipes, only: [:index, :create] 
 # resources :users, only: [:show, :create]
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post '/recipes/:recipe_id/user', to: 'recipes#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
