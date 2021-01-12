Rails.application.routes.draw do
  root "articles#index" #The root addres to the page

  #get "/articles", to: "articles#index" #Creating a route with article_contrller def index
  #get "/articles/:id", to: "articles#show"
  resources :articles do # all routes for CRUD articles
    resources :comments
  end
end
