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
end
