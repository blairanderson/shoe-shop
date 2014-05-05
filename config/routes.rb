ShoeShop::Application.routes.draw do
  root to: redirect('/pairs/newest/all')

  resources :posts, path: "pairs" do
    member do
      post :callback
    end
    resources :watched_items, path: "watch", only: [:create, :destroy]
    resources :comments, shallow: true
    resources :images, shallow: true
    member do
      get :upvote
      get :downvote
    end
  end
  get 'pairs/:sort/:filter', to: 'filters#index', as: 'filters'
  get 'pairs/:sort/:filter/sold', to: 'filters#sold', as: 'sold_filters'
  post 'pairs/:sort/:filter', to: 'filters#toggle', as: 'toggle_filters'

  resources :users do
    resources :watched_items, path: "watching", only: [:index]
  end

  resource :profile, only: [:show, :update]  do
    collection do
      get :watching, to: 'watched_items#index', as: :watching
    end
  end

  resource :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root to: :dashboard
    post 'users/:id' => 'users#reset_user_password', as: 'reset_user_password'
    resources :sizes
    resources :posts
    resources :users
    resources :blog_posts
  end

  resources :password_resets
  resources :blog_posts, path: 'blog', only: [:show, :index] do
    collection do
      post 'webhook/:token' => 'blog_posts#webhook'
    end
  end

  match 'auth/twitter/callback', to: 'sessions#twitter_auth', via: [:get, :post]

  match '404' => 'errors#not_found', via: [:get, :post]
  match '422' => 'errors#not_found', via: [:get, :post]
  match '500' => 'errors#error', via: [:get, :post]

  get 'sitemap', :to => 'pages#sitemap'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tos', to: 'pages#tos'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'facebook', to: redirect("https://facebook.com/solesout")
  get 'twitter', to: redirect("https://twitter.com/solesout")

  get ':missing', to: "errors#not_found"
end
