Rails.application.routes.draw do
  resources :users

  get 'hello' => 'hello#index'
end
