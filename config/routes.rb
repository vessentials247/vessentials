Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'pages/faq'
  get  'pages/plans'
  get  'pages/how'
  get  'pages/donate'
  root 'pages#index'
end
