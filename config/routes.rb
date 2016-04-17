Rails.application.routes.draw do
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "registrations" }
  resources :posts do
    resources :comments
  end

  get 'wrongnumbersong/user/:id' => 'users#show'
  get 'wrongnumbersong/users' => 'users#index'

  # root 'posts#index'
  root 'users#count'
end
