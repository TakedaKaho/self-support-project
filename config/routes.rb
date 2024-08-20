Rails.application.routes.draw do
 # 顧客用
 # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
 
 
 # 管理者用ユーザー管理
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # 顧客用ユーザー管理
  scope module: :public do
     resources :users, only: [:show, :edit, :update] do
      collection do
        get 'check'
        patch 'out'
        #上記で任意のアクションのルーティング
      end
     end 
     
  end
  
end
