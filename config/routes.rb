Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 scope module: :public do
  root to: 'homes#top'
  get 'about' => 'homes#about'
 end

  # ユーザー側
# URL /customers/sign_in ...
devise_for :User,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
end
