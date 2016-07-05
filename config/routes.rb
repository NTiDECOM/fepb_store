Rails.application.routes.draw do
  root 'products#index'

  devise_for :users, :controllers => {sessions: "users/sessions"}

  resources :books
  resources :cds
  resources :dvds
  resources :products
  resources :shirts
  resources :tickets
  resources :users
  resource :sale, only: [:show, :destroy]
  resources :sales, only: [:index]
  resources :sale_items, only: [:create, :update, :destroy]

  post 'add_sale_item' => 'sales#add_sale_item', as: 'add_sale_item'
  patch 'finalize_sale' => 'sales#finalize', as: 'finalize_sale'
  get '/inventory' => 'products#inventory', as: 'inventory'
  get '/report/books' => 'reports#books', as: 'books_report'

end
