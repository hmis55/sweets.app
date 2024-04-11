Rails.application.routes.draw do

devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :posts, only: [:show, :edit, :new, :index, :create]
    resources :users, only: [:show, :edit, :update, :unsubscribe]
 end
end