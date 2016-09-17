Rails.application.routes.draw do

  resources :links
  get 'tags/:tag',to: 'links#index', as: :tag
  root 'links#index'
  devise_for :users, controllers: { registrations: 'registrations' }
end
