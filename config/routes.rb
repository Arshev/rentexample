Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    resources :fines, on: :member
  end
  # resources :fines

  root 'index#index'
  get 'index/index'

  post 'login' => 'login#sign_in'
  get 'login' => 'login#index'

  resources :registration, :only => [:index, :create]

  resources :adminka, :only => [:index, :create, :update]

end
