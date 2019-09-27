Rails.application.routes.draw do
  get "/companies", to: "companies#index"
  post "/companies", to: "companies#create"
  get "/companies/new", to: "companies#new", as: 'new_company'
  get "/companies/:id/edit", to: "companies#edit", as: 'edit_company'
  get "/companies/:id", to: "companies#show", as: 'company'
  patch "/companies/:id", to: "companies#update"
  put "/companies/:id", to: "companies#update"
  delete "/companies/:id", to: "companies#destroy"

  root 'main#index'
end
