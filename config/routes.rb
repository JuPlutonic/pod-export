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
