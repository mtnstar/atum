Rails.application.routes.draw do
  get 'users/authenticate'

  get 'users/index'

  get 'users/destroy'

  get 'users/update'

  get 'users/create'

  resources :pv_sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
