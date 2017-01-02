Rails.application.routes.draw do
  get 'items/create'

  devise_for :users
  resources :users do
    resources :items
  end
  root 'welcome#index'
end
