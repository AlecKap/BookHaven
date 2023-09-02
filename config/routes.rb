Rails.application.routes.draw do
  root "welcome#index"
  resources :library_books
  resources :books
  resources :libraries

  # Defines the root path route ("/")
  # root "articles#index"
end
