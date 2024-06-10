Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'user/homes#top'
  get 'home/about' => 'user/homes#about', as: 'about'

  scope module: :user do
    
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
    resources :users, only: [:index, :show, :update, :edit] do
      resource :relationships, only: [:create, :destroy]
    	get "followings" => "relationships#followings", as: "followings"
    	get "followers" => "relationships#followers", as: "followers"
    end
  
    resources :groups, except: [:destroy]
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
    
  end

  namespace :admin do
      root to: 'homes#top'
  end

end
