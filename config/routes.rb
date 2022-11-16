Rails.application.routes.draw do

  # 学生用
  devise_for :students,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about"
    resources :students, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :taken_courses, only: [:create, :destroy]
    resources :chats, only: [:create]
    resources :rooms, only: [:index, :show]
    resources :bbses, only: [:index, :show, :create] do
      resources :threds, only: [:show, :create, :destroy] do
        resources :thred_comments, only: [:create, :destroy]
      end
    end
    get "search" => "searches#search"
  end
end
