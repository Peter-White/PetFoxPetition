Rails.application.routes.draw do
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :posts do
    resources :comments
  end

  get 'wrongnumbersong/user/:id' => 'users#show'
  get 'wrongnumbersong/users' => 'users#index'

  root 'posts#index'
end
