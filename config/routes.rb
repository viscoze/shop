Rails.application.routes.draw do
  root 'store#index'

  resources :orders
  resources :line_items
  resources :carts

  resources :products do
    get :who_bought, on: :member
  end
end
