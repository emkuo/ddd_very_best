Rails.application.routes.draw do
  resources :venues
  resources :favorited_dishes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
