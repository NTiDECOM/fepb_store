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
  resource :sale, only: [:show, :destroy] do
    get 'history_details/:sale_id' => 'sales#history_details', as: :history_details, on: :collection
  end
  resources :sales, only: [:index] 
  resources :sale_items, only: [:create, :update, :destroy]

  post 'add_sale_item' => 'sales#add_sale_item', as: 'add_sale_item'
  patch 'finalize_sale' => 'sales#finalize', as: 'finalize_sale'
  get 'inventory' => 'products#inventory', as: 'inventory'
  get '/report/books' => 'reports#books', as: 'books_report'

  # Reports Routes
  namespace :reports do
    get 'month-report', to: 'sales_report#month_report', as: 'month_sales_report'
  end
end
