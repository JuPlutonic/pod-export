# == Route Map
#
#          Prefix Verb URI Pattern                Controller#Action
#   pods_index GET  /pods/index(.:format)   pods#index
#            root GET  /                          pods#index
#
# for root it is possible to get search in F2F (c) with ?looking_for=
#
#         contact GET  /contact(.:format)         pods#contact
#           about GET  /about(.:format)           pods#about
#

Rails.application.routes.draw do
  get 'pods/index'
  root 'pods#index'
  resources :pods do
    member do
      patch :update_span
    end
  end
  get 'contact' => 'pods#contact', as: :contact
  get 'about' => 'pods#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
