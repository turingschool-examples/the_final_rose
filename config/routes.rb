Rails.application.routes.draw do

  get '/bachelorettes/:id', to: 'bachelorettes#show'
  get '/bachelorettes/:id/contestants', to: 'bachelorette_contestants#index'

  get '/contestants/:id', to: 'contestants#show'

  get '/outings/:id', to: 'outings#show'
end
