Rails.application.routes.draw do
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  root 'store#index'

  get 'admin' => 'admin#index'

  controller :session do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  resources :products do
    get :who_bought, on: :member
  end
end
