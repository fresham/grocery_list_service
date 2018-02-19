Rails.application.routes.draw do
  # health check endpoints
  get 'ping', to: 'health#ping'
  get 'health', to: 'health#health'

  resources :grocery_items
end
