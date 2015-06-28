# == Route Map
#
#  Prefix Verb URI Pattern                        Controller#Action
#    root GET  /                                  roots#index
# reports GET  /reports(.:format)                 reports#index
#         GET  /auth/:provider/callback(.:format) sessions#create
#

Rails.application.routes.draw do
  root to: 'roots#index'
  resources :reports, only: [:index]
  get '/auth/:provider/callback', to: 'sessions#create'
end

