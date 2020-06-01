Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/bachelorettes/:id", to: "bachelorettes#show"
  get "/bachelorettes/:id/contestants", to: "bachelorette/contestants#index"
end
