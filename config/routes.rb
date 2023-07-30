Rails.application.routes.draw do
  devise_for :users, path:'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root  "blogs#index"

  get   "/blogs/write",    to: "blogs#write"    
  get   "/blogs/all",      to: "blogs#all"
  post  "/blogs/create",   to: "blogs#create"

  post "/blogs/:blog_id/comments/create/:parent_id",  to: "comments#create"
  get "/blogs/:blog_id/comments/:parent_id", to: "comments#blog_comments"

  get "/blogs/:id", to: "blogs#blog"
  delete "/blogs/:id", to: "blogs#delete"

  get "auth/sign_out", to: "users#sign_out"

end
