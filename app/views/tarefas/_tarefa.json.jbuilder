json.extract! tarefa, :id, :titulo, :descricao, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
