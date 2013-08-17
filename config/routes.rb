ShoeShop::Application.routes.draw do
  root to: 'posts#index'
  
  resources :posts, path: "pairs" do
    resources :images, shallow: true
    member do 
      get 'upvote'
      get 'downvote'
    end
  end


  
  resources :users
  get 'profile' => 'users#profile'
    
  resource :sessions, only: [:new, :create, :destroy]

  scope '/admin' do
    resources :sizes
  end

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
end
