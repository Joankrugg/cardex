 Rails.application.routes.draw do
  resources :mail_orders

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :companies do
    collection {post :import}
  end
  devise_for :users
  root to: 'pages#home'
  resources :customers, only: [:index, :new, :create] do
    collection {post :import }
  end
  resources :millesime_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :francophone_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :anglophone_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :raba_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :leognan_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :brindos_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :sacy_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :megeve_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :porto_customers do
    collection {post :import}
    collection {get :export}
  end
  resources :theoule_customers do
    collection {post :import}
    collection {get :export}
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
