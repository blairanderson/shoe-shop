ShoeShop::Application.routes.draw do

  root to: 'posts#index'
  
  resources :posts, path: "pairs" do
    resources :comments, shallow: true
    resources :images, shallow: true
    member do 
      get 'upvote'
      get 'downvote'
    end
  end
  get 'pairs/:sort/:filter', to: 'filters#index', as: 'filters'
  
  resources :users
  get 'profile' => 'users#profile'
    
  resource :sessions, only: [:new, :create, :destroy]

  scope '/admin' do
    resources :sizes
  end

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'about', to: 'pages#about'
  get 'tos', to: 'pages#tos'
  get 'privacy_policy', to: 'pages#privacy_policy'
end
