Rails.application.routes.draw do
  resources :comment
  resources :user
  resources :sub
  resources :post
  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
