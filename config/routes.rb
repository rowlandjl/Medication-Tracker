Rails.application.routes.draw do
  devise_for :users

  resource :dashboard, only: [:show]

  authenticated :user do
    root 'dashboards#show'
  end

  root 'welcome_pages#index'

<<<<<<< HEAD
=======
  devise_for :users

  resource :prescriptions
>>>>>>> user_adds_prescription
end
