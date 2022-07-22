 Rails.application.routes.draw do
  root to: 'pages#home'
  get 'brindos_lac_et_chateau', to:'pages#brindos_lac_et_chateau'
  get 'cocorico', to: 'pages#cocorico'
  get 'la_plage_blanche', to:'pages#la_plage_blanche'
  get 'le_chateau_de_sacy', to:'pages#le_chateau_de_sacy'
  get 'le_domaine_de_raba', to:'pages#le_domaine_de_raba'
  get 'le_soleil_d_or', to:'pages#le_grand_hotel_du_soleil_d_or'
  get 'le_manege', to:'pages#le_manege'
  resources :mail_orders

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :companies do
    collection {post :import}
  end
  devise_for :users

  resources :customers do
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
