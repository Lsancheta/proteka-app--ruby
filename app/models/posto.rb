class Posto < ApplicationRecord
   has_many :posto_checklists
   has_many :checklists, through: :posto_checklists
   has_many :roteiros
end
