Former::Application.routes.draw do

  root to: 'students#me'

  resources :blogs

  devise_for :admins
  devise_for :students

  resources :forms do
    resources :filled_forms
  end

  resources :students do
    get 'me', on: :collection
  end

  namespace :admin do
    resources :fields
    resources :forms do
      member { put :sort }
      resources :filled_forms
    end
  end
end
