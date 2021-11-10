class Admin < ApplicationRecord
    has_secure_password
    validates :username, presence: {message: "É obrigatório informar o nome de usuário!"}, uniqueness: {message: 'Nome de usuário não está disponível!'}
end
