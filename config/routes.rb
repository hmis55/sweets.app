Rails.application.routes.draw do

devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    #post_commrntはpostに紐づいているため、ネストさせる
    resources :posts, only: [:show, :edit, :new, :index, :create, :destroy, :update] do
     resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :unsubscribe]
 end
end