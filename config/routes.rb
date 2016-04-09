Rails.application.routes.draw do
  namespace :api do
    resources :pv_sites
    resources :locations, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
