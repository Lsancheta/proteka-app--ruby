class Roteiro < ApplicationRecord
    belongs_to :posto
    has_and_belongs_to_many :usuarios
end