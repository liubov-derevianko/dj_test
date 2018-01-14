Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  get 'update_state' => 'orders#update_state'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
