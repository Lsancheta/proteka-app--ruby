Rails.application.routes.draw do
  post '/login', to:  'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  root 'menu#index'
  resources :postos
  resources :usuarios
  resources :tarefas
  resources :checklists
  resources :roteiros

  get 'usuarios/index'
  get 'postos/index'
  get 'menu/index'
  get 'tarefas/index'
  get 'checklist/index'

end
