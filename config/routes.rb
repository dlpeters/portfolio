Portfolio::Application.routes.draw do

  get '/sign_up' => "users#new", :as => "signup"
  resources :users, :only => [:create]

  get '/log_in' => "sessions#new", :as => "log_in"
  resources :sessions, :only => [:create]

  resources :blog, :only => [:index, :show]

  namespace :admin do 
    resources :posts
    resources :projects
  end

  root :to => 'blog#index'

end
