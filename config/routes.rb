Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'hello#index'
end
