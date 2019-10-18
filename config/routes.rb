Rails.application.routes.draw do
  get '/transactions/new', to: 'transactions#new'
  get '/transactions/kind', to: 'transactions#kind'
  post '/transactions/upload_file', to: 'transactions#upload_file'

  get '/stores/index', to: 'stores#index'
  get '/stores/show/:id', to: 'stores#show', as: 'store'

  root 'stores#index'
end
