Rails.application.routes.draw do

  root 'tests#index'

  devise_for  :users, controllers: {  registrations: 'users/registrations',
                                      sessions: 'users/sessions'},
              path: :gurus,
              path_names: { sign_in: :login, sign_out: :logout }

  get 'sessions/new'

  get 'users/new'

  get 'tests/index'
  get 'tests/show'

  get 'feedback/new'
  post 'feedback/sendmessage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update, :result, :gist] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: [:index]

    resources :badges

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
