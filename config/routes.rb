# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :comments
      resources :comment_reactions
    end
  end
  resources :comment_reactions
  resources :comments
  resources :posts
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
