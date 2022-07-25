Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'data/new'

  get 'pods/index'
  root 'pods#index'
  # rubocop:disable Style/BlockDelimiters
  resources :pods, param: :tax_payer_id # do
  #   member do; patch :update_page_nav; end;
  # end
  resources :page_navs, only: :create do; post 'create', on: :member; end
  # rubocop:enable Style/BlockDelimiters
  get 'contact' => 'pods#contact', as: :contact
  get 'about' => 'pods#about', as: :about
end
