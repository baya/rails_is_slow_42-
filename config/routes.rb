Rails.application.routes.draw do
  resources :users

  get 'users_index_erb' => 'users#index_erb'
  get 'hello' => 'hello#index'
end
