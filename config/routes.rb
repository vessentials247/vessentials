Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # Delete Me!
  get 'hello_world', to: 'hello_world#index'

  get  'pages/faq'
  get  'pages/checkout'
  get  'thanks', to: 'charges#thanks', as: 'thanks'

  devise_for :users

  # Maybe just put in public DIR later
  get  '/how'     => 'pages#how'
  get  '/faq'     => 'pages#faq'
  get  '/plans'   => 'pages#plans'
  get  '/contact' => 'pages#contact'

  resources :charges
end
