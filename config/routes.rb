Rubee::Router.draw do |router|
  router.get "/", to: "welcome#show" # override it for your app
  router.get "/users", to: "users#index"

  router.get "/styles/{path}", to: "main#style"
  router.get "/scripts/{path}", to: "main#script"
end
