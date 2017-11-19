Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'pages/faq'
  get  'pages/plans'
  get  'pages/how'
  get  'pages/donate'
  resources :charges
  root 'pages#index'
end
