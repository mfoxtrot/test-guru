Rails.application.routes.draw do
  root 'tests#index'
  get 'tests/index'
  get 'tests/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
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
end
