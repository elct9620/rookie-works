Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root 'home#index'

  resources :projects, only: %i[index show]
  resources :games, except: %i[index show]
  resources :exhibitions, only: %i[show]
end
