
class ChecklistTarefa < ApplicationRecord
  belongs_to :checklist
  belongs_to :tarefa
  
#  has_many :checklist_associations, dependent: :destroy
#  has_many :checklists, through: :checklist_associations

#  has_many :tarefas_associations, dependent: :destroy
#  has_many :tarefas, through: :tarefas_associations
end
