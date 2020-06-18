Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  get '/sign_in', to: 'users#sign_in_view'
  post '/sign_in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'
  root to: "users#new"
end
