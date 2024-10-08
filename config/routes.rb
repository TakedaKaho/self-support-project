Rails.application.routes.draw do
 # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 # 管理者用
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
 
 # 管理者用ユーザー管理
  namespace :admin do
   get '/', to: 'homes#top', as: :root
    resources :users, only: [:index, :show, :edit, :update]
    resources :tweets, only:[:index, :destroy]
  end

  # 顧客用ユーザー管理
  scope module: :public do
   root :to =>"homes#top"
     resources :users, only: [:show, :edit, :update] do
      member do
        get 'check'
        patch 'out'
      end
     end 
     
     resources :tasks, only:[:new, :create, :index, :destroy] do
      member do
       patch 'update_status'
      end
     end
     resources :body_logs, only:[:new, :create, :index, :edit, :update, :destroy]
     resources :goals, only:[:new, :create, :index, :destroy]
     resources :meal_logs, only:[:new, :create, :index, :edit, :update, :destroy]
     resources :exercise_logs, only:[:new, :create, :index, :edit, :update, :destroy]
     resources :tweets, only:[:create, :index, :destroy]
  end
end
