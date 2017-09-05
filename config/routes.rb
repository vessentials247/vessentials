Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'pages/about'
  get  'pages/help'
  root 'pages#index'
end
