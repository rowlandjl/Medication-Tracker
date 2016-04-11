Rails.application.routes.draw do
  root 'welcome_pages#index'

  devise_for :users
end
