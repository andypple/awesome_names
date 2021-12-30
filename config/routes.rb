Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'name_lists#index'
  get '/:name_list_id', to: 'name_lists#show'

  namespace :api do
    resources :name_lists, only: [:show]
    resources :baby_names, only: [:create]
  end
end
