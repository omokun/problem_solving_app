Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main_issues#index"
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy] 
  resources :main_issues, only: [:new, :create, :index, :show, :edit, :update, :destroy]  do
    resources :sub_issues, only: [:new, :create, :index, :show, :edit, :update, :destroy] 
  end
end

