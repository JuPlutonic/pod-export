# == Route Map
#
#     Prefix Verb   URI Pattern              Controller#Action
# pods_index GET    /pods/index(.:format)    pods#index
#       root GET    /                        pods#index
#       pods GET    /pods(.:format)          pods#index
#            POST   /pods(.:format)          pods#create
#    new_pod GET    /pods/new(.:format)      pods#new
#   edit_pod GET    /pods/:id/edit(.:format) pods#edit
#        pod GET    /pods/:id(.:format)      pods#show
#            PATCH  /pods/:id(.:format)      pods#update
#            PUT    /pods/:id(.:format)      pods#update
#            DELETE /pods/:id(.:format)      pods#destroy
#    contact GET    /contact(.:format)       pods#contact
#      about GET    /about(.:format)         pods#about

Rails.application.routes.draw do
  get 'pods/index'
  root 'pods#index'
  resources :pods # do
  # member do
  #   patch :update_span
  # end
  # end
  get 'contact' => 'pods#contact', as: :contact
  get 'about' => 'pods#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
