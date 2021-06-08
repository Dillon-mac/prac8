Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root to: 'store#index', as: 'store'
  resources :products do
    get :who_bought, on: :member
  end
end
