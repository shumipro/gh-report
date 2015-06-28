# == Route Map
#
# Prefix Verb URI Pattern                        Controller#Action
#   root GET  /                                  roots#index
#        GET  /auth/:provider/callback(.:format) sessions#create
#

Rails.application.routes.draw do
  root to: 'roots#index'
  get '/auth/:provider/callback', to: 'sessions#create'
end

