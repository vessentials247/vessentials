Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'hello_world', to: 'hello_world#index'
  devise_for :users

  get  'pages/faq'
  get  'pages/plans'
  
  get  'pages/checkout'
  # Maybe just put in public DIR later
  get  '/how' => 'pages#how'
  get  '/faq' => 'pages#faq'
  get  '/plans' => 'pages#plans'
  get  '/contact' => 'pages#contact'
  get  '/pricing' => 'pages#pricing'

  resources :charges
  get 'thanks', to: 'charges#thanks', as: 'thanks'
end
