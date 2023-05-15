#class Checklist < ApplicationRecord
#    has_and_belongs_to_many :tarefas
    #has_many :checklist_tarefas, dependent: :destroy
#end

class Checklist < ApplicationRecord
    has_many :posto_checklists
    has_many :checklist_tarefas, dependent: :nullify
    has_many :tarefas, through: :checklist_tarefas
    has_many :postos, through: :posto_checklists 

    before_destroy :remove_checklist_tarefas 

    def remove_checklist_tarefas
        self.checklist_tarefas.update_all(checklist_id: nil)
    end

end
