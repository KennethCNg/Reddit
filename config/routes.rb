Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :subs, only: [:index, :show, :new, :create, :update, :edit, :destroy]
  resources :posts, only: [:new, :create, :show, :destroy, :update, :edit]
end
