Rails.application.routes.draw do

  root "web#index"

  get "web/index", to: "web#index"

  get "/sources", to: "web#index"
  get "/sources/:id", to: "web#index"
  get "/sources/:id/edit", to: "web#index"
  get "/sources/new", to: "web#index"

  namespace :api, format: 'json' do
    resources :sources
    get "/sources/:id/code", to: "sources#code"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
