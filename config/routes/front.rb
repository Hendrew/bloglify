scope module: :front do
  get "/", to: "articles#index", as: :articles
  get "/:slug", to: "articles#show", as: :article

  root "articles#index"
end
