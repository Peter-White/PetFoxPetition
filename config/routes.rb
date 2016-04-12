Rails.application.routes.draw do
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
