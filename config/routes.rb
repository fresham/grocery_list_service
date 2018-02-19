Rails.application.routes.draw do
  get 'ping' => 'health#ping'
  get 'health' => 'health#health'

  post 'login' => 'user_token#create'

  resources :grocery_items
end
