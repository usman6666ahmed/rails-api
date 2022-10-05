Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root "home#index"
  resources :users, only: [:show, :index] do
    collection do
      get "me"
    end
  end

  resources :posts
end
