Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: [:show]

  resources :prescriptions

  authenticated :user do
    root 'dashboards#show', :as => 'user_root'
  end

  root 'welcome_pages#index'

end
