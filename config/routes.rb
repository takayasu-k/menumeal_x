Rails.application.routes.draw do

  devise_for :users

  root 'top#index'
  get 'top/index'
  get 'top/about'
  get 'top/show'

  resources :shops
  get 'shops/:id/menu' => 'shops#shop_menu', as: 'shop_menu'
  resources :menus
  resources :reviews
  get 'shop_detail/:id/new' => 'shop_details#new', as: 'shop_detail_new'
  resources :shop_details
  resources :user_profiles
  resources :users do
    member do
     get :following, :followers, :eaten_menus, :desired_menus, :likes
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :eaten_menus, only: [:create, :destroy]
  resources :desired_menus, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

end
