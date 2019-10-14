Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "children#index"

  resources :children do 
    resources :memories
  end 

  resources :categories, only: [:index, :show]

  resources :users, only: [:show, :destroy]
end
