Rails.application.routes.draw do
  concern :commentable do
    resources :comments, only: %i[create update]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root 'home#index'

  resources :projects, only: %i[index show]
  resources :games, except: %i[index show]
  resources :exhibitions, only: %i[show]
  resources :bookmarks, only: %i[index create destroy]
  resources :experiences, except: %i[destroy], concerns: :commentable
end
