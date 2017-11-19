Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'pages/faq'
  get  'pages/plans'
  get  'pages/how'
  get  'pages/donate'
  resources :charges
  root 'pages#index'
end
