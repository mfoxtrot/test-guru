Rails.application.routes.draw do
  root 'tests#index'
  get 'tests/index'
  get 'tests/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true
  end
end
