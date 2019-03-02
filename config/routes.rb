Rails.application.routes.draw do
  devise_for :users


  #Admin stuff
  namespace :admin  do
    resources :payloads
  end

  resource :external
  root to: "externals#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
