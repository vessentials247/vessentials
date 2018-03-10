Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'hello_world', to: 'hello_world#index'
  devise_for :users

  get  'pages/faq'
  get  'pages/plans'
  get  'pages/how'
  get  'pages/checkout'
  get  'pages/donate'
  get  'pages/pricing'

  resources :charges
  get 'thanks', to: 'charges#thanks', as: 'thanks'
end
