#class Checklist < ApplicationRecord
#    has_and_belongs_to_many :tarefas
    #has_many :checklist_tarefas, dependent: :destroy
#end

class Checklist < ApplicationRecord
    has_many :posto_checklists
    has_many :checklist_tarefas, dependent: :destroy
    has_many :tarefas, through: :checklist_tarefas
    has_many :postos, through: :posto_checklists 

    before_destroy :cleanup_checklist_tarefas

    def cleanup_checklist_tarefas
        checklist_tarefas.destroy_all
    end

end
