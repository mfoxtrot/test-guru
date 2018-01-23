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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update, :result] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end
end
