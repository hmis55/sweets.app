Rails.application.routes.draw do

  devise_for :admin, skip: [:passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  get "/search", to: "searches#search"

 #ユーザー側
  scope module: :public do
   root to: 'homes#top'
   get 'about' => 'homes#about'
    
   #コメント機能、いいね機能
   resources :posts, only: [:show, :edit, :new, :index, :create, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
   end
   
   #フォローフォロワー機能のルーティングをUserへネスト
   resources :users, only: [:show, :edit, :update] do
    collection do
      get 'mypage', to: 'users#mypage' 
      get 'unsubscribe', to: 'users#unsubscribe'
      patch 'withdraw', to: 'users#withdraw'
    end
    
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
   end
    
    #DM機能
   resources :chats, only: [:show, :create, :destroy]
  end
  
 #管理者側
   namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end
    
    #ゲストログイン
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
end