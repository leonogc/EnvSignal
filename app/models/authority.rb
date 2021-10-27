class Authority < ApplicationRecord

    has_secure_password
    validates :name, presence: {message: "É obrigatório informar o nome!"}
    validates :identifier, presence: {message: "É obrigatório informar o identificador!"}, uniqueness: {message: 'Identificador não está disponível!'}
end
