Rails.application.routes.draw do
  root "welcome#index"
  resources :libraries do
    resources :books, only: [:new, :create, :show], controller: "libraries/books"
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
