Rails.application.routes.draw do
  
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
