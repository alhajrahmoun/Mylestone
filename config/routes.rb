Rails.application.routes.draw do
  resources :milestones
  devise_for :users
  root 'milestones#index'

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :milestones
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
