Rails.application.routes.draw do


  get 'daycares/index'
  get 'daycares/new'
  get 'daycares/create'
  get 'daycares/show'
  get 'daycares/edit'
  get 'daycares/update'
    # 顧客用
    # URL /customers/sign_in ...
    devise_for :users,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    devise_scope :user do
      post 'user/guest_sign_in', to: 'gests/sessions#guest_sign_in'
    end


    scope module: :public do
      root to: 'homes#top'
      get 'about' => 'homes#about', as: 'about'
      get '/users/information/edit' => 'userrs#edit'
      patch '/users/information' => 'users#update'
      get '/users/my_page' => 'users#show'
      get '/users/unsubscribe' => 'users#unsubscribe'
      patch '/users/withdraw' => 'users#withdraw'
    end

    # 管理者用
    # URL /admin/sign_in ...
    devise_for :admin,skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }

    namespace :admin do
      get 'top' => 'homes#top', as: 'top'
      resources :daycares, only: [:index, :new, :create, :edit, :show, :update]
      resources :users, only: [:index, :show, :edit, :update]
    end

end