class Authority < ApplicationRecord

    has_secure_password validations: false
    validates :name, presence: {message: "É obrigatório informar o nome!"}
    validates :identifier, presence: {message: "É obrigatório informar o identificador!"}, uniqueness: {message: 'Identificador não está disponível!'}
    validates :password, presence: {message: "É obrigatório informar a senha!"}, on: :create
end
