scope module: :front do
  resources :articles

  root "articles#index"
end
