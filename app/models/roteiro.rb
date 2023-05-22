class Roteiro < ApplicationRecord
    belongs_to :posto
    has_and_belongs_to_many :usuarios, dependent: :nullify, join_table: :roteiros_usuarios

    accepts_nested_attributes_for :usuarios, allow_destroy: true
end
