namespace :api do
  namespace :v1 do
    resources :articles, only: %i[ index show ]
  end
end
