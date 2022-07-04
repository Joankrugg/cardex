 Rails.application.routes.draw do
  resources :raba_customers do
    collection {post :import}
  end
  resources :millesime_customers do
    collection {post :import}
    collection {get :export}
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :companies do
    collection {post :import}
  end
  mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  resources :customers, only: [:index, :new, :create] do
    collection {post :import }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
