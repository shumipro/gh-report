# == Route Map
#
# Prefix Verb URI Pattern                        Controller#Action
#        GET  /auth/:provider/callback(.:format) sessions#create
#

Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
end

