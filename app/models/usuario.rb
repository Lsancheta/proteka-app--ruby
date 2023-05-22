class Usuario < ApplicationRecord
    has_many :postos
    has_and_belongs_to_many :roteiros, dependent: :nullify, join_table: :roteiros_usuarios
end
