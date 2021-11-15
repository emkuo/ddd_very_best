Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :neighborhoods
  resources :bookmarks
  resources :venues
  resources :favorited_dishes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
