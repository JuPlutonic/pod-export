# == Route Map
#
#     Prefix Verb   URI Pattern                        Controller#Action
#   data_new GET    /data/new(.:format)                data#new
# pods_index GET    /pods/index(.:format)              pods#index
#       root GET    /                                  pods#index
#       pods GET    /pods(.:format)                    pods#index
#            POST   /pods(.:format)                    pods#create
#    new_pod GET    /pods/new(.:format)                pods#new
#   edit_pod GET    /pods/:tax_payer_id/edit(.:format) pods#edit
#        pod GET    /pods/:tax_payer_id(.:format)      pods#show
#            PATCH  /pods/:tax_payer_id(.:format)      pods#update
#            PUT    /pods/:tax_payer_id(.:format)      pods#update
#            DELETE /pods/:tax_payer_id(.:format)      pods#destroy
#  page_navs POST   /page_navs(.:format)               page_navs#create
#    contact GET    /contact(.:format)                 pods#contact
#      about GET    /about(.:format)                   pods#about

Rails.application.routes.draw do
  get 'data/new'

  get 'pods/index'
  root 'pods#index'
  resources :pods, param: :tax_payer_id # do
    # member do; patch :update_page_nav; end;
  # end
  resources :page_navs, only: :create do; post 'create', on: :member; end
  get 'contact' => 'pods#contact', as: :contact
  get 'about' => 'pods#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
