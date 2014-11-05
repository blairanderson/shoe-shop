ShoeShop::Application.routes.draw do
  root to: redirect('/pairs/newest/all')
  # ADMIN
  namespace :admin do
    root to: :dashboard
    post 'users/:id' => 'users#reset_user_password', as: 'reset_user_password'
    resources :sizes
    resources :posts
    resources :users
    resources :blog_posts
  end

  # POSTS
  resources :posts, path: 'pairs' do
    member do
      post :callback
    end
    resources :comments, shallow: true
    resources :images, shallow: true
  end
  get 'pairs/:sort/:filter', to: 'filters#index', as: 'filters'
  get 'pairs/:sort/:filter/sold', to: 'filters#sold', as: 'sold_filters'
  post 'pairs/:sort/:filter', to: 'filters#toggle', as: 'toggle_filters'


  # USERS
  match 'auth/twitter/callback', to: 'sessions#twitter_auth', via: [:get, :post]

  resource :sessions, only: [:new, :create, :destroy]
  resources :users
  resource :profile, only: [:show, :update]

  resources :password_resets, only: [:create, :edit, :update]

  get 'sitemap', to: 'pages#sitemap'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tos', to: 'pages#tos'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'stats', to: 'pages#stats'
  get 'facebook', to: redirect('https://facebook.com/solesout')
  get 'twitter', to: redirect('https://twitter.com/solesout')

  match '404' => 'errors#not_found', via: [:get, :post]
  match '422' => 'errors#not_found', via: [:get, :post]
  match '500' => 'errors#error', via: [:get, :post]
  get ':missing', to: 'errors#not_found'
end
