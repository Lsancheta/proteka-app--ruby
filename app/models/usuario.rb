class Usuario < ApplicationRecord
    has_many :postos
    has_many :roteiros
end
