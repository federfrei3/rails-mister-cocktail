# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  get 'doses/destroy'

  root to: 'cocktails#index'

  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  
  resources :doses, only: [:destroy]
end
