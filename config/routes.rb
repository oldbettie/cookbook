Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :pages, only: :index do
    :recipes
  end

  resources :users
  resources :recipes do
    resources :comments, only: [:new, :edit, :create, :update]

  end
  resources :comments
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
