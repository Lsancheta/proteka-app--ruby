class Usuario < ApplicationRecord
    has_secure_password

    #def welcome
     #   "Oá, #{self.nome}!"
    #end
    has_many :postos
    has_and_belongs_to_many :roteiros, dependent: :nullify, join_table: :roteiros_usuarios

    validates :password, length: {within: 4..20}
    validates :re, uniqueness: true 
    validates :nome, presence: true
    validates :email, presence: true, allow_blank: true
    #usuario teste re: 123456 senha: lucas
end
