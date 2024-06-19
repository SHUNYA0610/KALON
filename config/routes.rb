Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions',
    passwords: 'user/passwords'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  root to: 'user/homes#top'
  get 'home/about' => 'user/homes#about', as: 'about'
  get "/search", to: "user/searches#search"

  scope module: :user do

    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:index, :show, :update, :edit, :destroy] do
      resource :relationships, only: [:create, :destroy]
    	get "followings" => "relationships#followings", as: "followings"
    	get "followers" => "relationships#followers", as: "followers"
      member do
       get :favorites
      end
    end

    resources :groups, only:  [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :group_users, only: [:create, :destroy]
      get "new/mail" => "groups#new_mail"
      get "send/mail" => "groups#send_mail"
    end
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]

    get 'tagsearches/search', to: 'tagsearches#search'

    resources :notifications, only: [:update]

  end

  namespace :admin do
    root to: 'homes#top'
    get "/search", to: "searches#search"

    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end

    resources :users, only: [:index, :show, :destroy] do
      get "/change_is_group_creator", to: "users#change_is_group_creator"
    end

    resources :groups, only: [:index, :show, :destroy]

    get 'tagsearches/search', to: 'tagsearches#search'

    resources :banners, only: [:new, :index, :create, :update, :destroy, :show, :edit]
  end

end
