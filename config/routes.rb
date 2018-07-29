Rails.application.routes.draw do
  
  devise_for :admin_users, skip: [:registrations], controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords'
  }
  namespace :admin do
    get 'top/index'
    get 'top/about'
    get 'top/show'
    resources :shops
    resources :shop_details
    resources :menus
    get 'shops/:id/menus' => 'shops#shop_menu', as: 'shop_menu'
    get 'shop_details/:id/new' => 'shop_details#new', as: 'shop_detail_new'
  end

  root 'top#index'

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:token_validations, :omniauth_callbacks]
  get 'api-docs', to: 'api_docs#index'
  get 'pref_shops/search'
  get 'pref_shops/:prefecture_id/shops/search' => 'shops#search_by_prefecture', as: 'shops_search_by_prefecture'
  get 'shops/search' => 'shops#search_by_keyword', as: 'shops_search_by_keyword'
  get 'shops/:id' => 'shops#shop_detail', as: 'shop_detail'
  get 'shops/:id/menus' => 'shops#shop_menu', as: 'shop_menu'
  resources :reviews, only: [:create, :update, :destroy]
  get 'menus/:id/reviews' => 'reviews#index'

  # devise_for :users, controllers: {
  #   sessions:      'users/sessions',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations'
  # }

  # get 'shops/:id/menu' => 'shops#shop_menu', as: 'shop_menu'
  # resources :menus
  # get 'shop_detail/:id/new' => 'shop_details#new', as: 'shop_detail_new'
  # resources :shop_details
  # resources :user_profiles
  # resources :users do
  #   member do
  #    get :following, :followers, :eaten_menus, :desired_menus, :likes
  #   end
  # end
  # resources :relationships, only: [:create, :destroy]
  # resources :eaten_menus, only: [:create, :destroy]
  # resources :desired_menus, only: [:create, :destroy]
  # resources :likes, only: [:create, :destroy]
  # get 'comments/:review_id/new' => 'comments#new', as: 'comments_new'
  # resources :comments
  # resources :cheerings, only: [:create, :destroy]

end
