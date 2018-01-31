# == Route Map
#
# Prefix Verb   URI Pattern          Controller#Action
#  users GET    /users(.:format)     users#index
#        POST   /users(.:format)     users#create
#   user GET    /users/:id(.:format) users#show
#        PATCH  /users/:id(.:format) users#update
#        PUT    /users/:id(.:format) users#update
#        DELETE /users/:id(.:format) users#destroy
#  memos GET    /memos(.:format)     memos#index
#        POST   /memos(.:format)     memos#create
#   memo GET    /memos/:id(.:format) memos#show
#        PATCH  /memos/:id(.:format) memos#update
#        PUT    /memos/:id(.:format) memos#update
#        DELETE /memos/:id(.:format) memos#destroy
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :memos
end
