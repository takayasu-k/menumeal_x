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
  resources :shop_details
end
