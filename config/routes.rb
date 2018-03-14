Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root 'home#index'

  resources :projects
  resources :exhibitions, only: %i[show]
end
