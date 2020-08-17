Rails.application.routes.draw do
  get 'words/new'
  get 'users/new'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'words#index'
  resources :users, only: [:show, :edit, :update]
  get 'users/rank' => 'users#rank', as:'users_rank'
  resources :words do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end
end
