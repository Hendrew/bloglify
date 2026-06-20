namespace :backoffice do
  resources :articles

  root "articles#index"
end
