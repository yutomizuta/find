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
    resources :students, only: [:index, :show, :edit, :update]
  end
end
