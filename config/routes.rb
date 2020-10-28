Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :update, :destroy] do
    resources :sub_tasks, only: [:index, :create, :update, :destroy]
  end
  
  resources :task_groups, only: [:index, :create, :destroy]
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/logged_in', to: 'auth#is_logged_in?'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
