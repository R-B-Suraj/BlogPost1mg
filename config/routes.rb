Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root  "blogs#index"

  get   "/blogs/write",    to: "blogs#write"    
  get   "/blogs/all",      to: "blogs#all"
  get   "/blogs/search",   to: "blogs#search"
  post  "/blogs/create",   to: "blogs#create"




end
