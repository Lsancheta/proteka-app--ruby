#class Tarefa < ApplicationRecord
#    has_and_belongs_to_many :checklists
    #has_many :checklist_tarefas
#end

class Tarefa < ApplicationRecord
    has_many :checklist_tarefas, dependent: :nullify
    has_many :checklists, through: :checklist_tarefas
end