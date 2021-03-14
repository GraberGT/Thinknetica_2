Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
    sessions: 'users/sessions'
  }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gists
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, shallow: true, only: :index
  end

  get 'admin/tests', to: "admin/tests#index", as: :admin_root
  get 'tests', to: "tests#index", as: :user_root
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
