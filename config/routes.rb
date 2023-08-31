Rails.application.routes.draw do
  resources :library_books
  resources :books
  resources :libraries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
