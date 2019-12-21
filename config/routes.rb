Rails.application.routes.draw do

  get '/bachelorettes/:id', to: "bachelorettes#show"
end
