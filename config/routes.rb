Rails.application.routes.draw do
  post '/login', to:  'sessions#create'
  post '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/unauthorized', to: 'errors#unauthorized'
  
  
  root 'menu#index'
  resources :postos
  resources :usuarios
  resources :tarefas
  resources :checklists
  resources :roteiros
  resource :session, only: [:new, :create, :destroy]


  get 'usuarios/index'
  get 'postos/index'
  get 'menu/index'
  get 'tarefas/index'
  get 'checklist/index'

end
