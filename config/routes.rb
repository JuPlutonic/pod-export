# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                  data_new GET    /data/new(.:format)                                                                      data#new
#                pods_index GET    /pods/index(.:format)                                                                    pods#index
#                      root GET    /                                                                                        pods#index
#                      pods GET    /pods(.:format)                                                                          pods#index
#                           POST   /pods(.:format)                                                                          pods#create
#                   new_pod GET    /pods/new(.:format)                                                                      pods#new
#                  edit_pod GET    /pods/:tax_payer_id/edit(.:format)                                                       pods#edit
#                       pod GET    /pods/:tax_payer_id(.:format)                                                            pods#show
#                           PATCH  /pods/:tax_payer_id(.:format)                                                            pods#update
#                           PUT    /pods/:tax_payer_id(.:format)                                                            pods#update
#                           DELETE /pods/:tax_payer_id(.:format)                                                            pods#destroy
#                  page_nav POST   /page_navs/:id/create(.:format)                                                          page_navs#create
#                 page_navs POST   /page_navs(.:format)                                                                     page_navs#create
#                   contact GET    /contact(.:format)                                                                       pods#contact
#                     about GET    /about(.:format)                                                                         pods#about
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'data/new'

  get 'pods/index'
  resources :pods, param: :tax_payer_id
  resources :page_navs, only: :create do
    post 'create', on: :member
  end
  get 'contact' => 'pods#contact', as: :contact
  get 'about' => 'pods#about', as: :about
  get 'welcome' => 'greeter#welcome', as: :welcome
  root 'greeter#welcome'
end
