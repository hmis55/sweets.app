Rails.application.routes.draw do

  devise_for :admin, skip: [:passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'users/mypage', to: 'users#mypage', as: 'mypage'
    
    #退会機能画面
    get  'users/unsubscribe' => 'users#unsubscribe'
    # 論理削除用のルーティング
    patch 'users/withdraw' => 'users#withdraw'
    
    #post_commrntはpostに紐づいているため、ネストさせる
    resources :posts, only: [:show, :edit, :new, :index, :create, :destroy, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    end
  
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
  end
end