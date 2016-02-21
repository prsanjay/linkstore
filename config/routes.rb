Rails.application.routes.draw do

  resources :links
  root 'links#index'
  devise_for :users, controllers: { registrations: 'registrations' }
end
