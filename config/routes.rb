Rails.application.routes.draw do
  
  root to: "articles#index"
  
  resources :articles do
    member do
      get "versions"
      get "version/:version_id", to: "articles#version", as: "version"
      post "revert/:version_id", to: "articles#revert", as: "revert"
      post "restore", to: "articles#restore", as: "restore"
    end
    collection do
      get "deleted", to: "articles#deleted"
    end
  end
end
