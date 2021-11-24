class User < ApplicationRecord
    
    has_secure_password
    validates :name, presence: {message: "É obrigatório informar o nome!"}
    validates :birth_date, presence: {message: "É obrigatório informar a data de nascimento!"}
    validates :username, presence: {message: "É obrigatório informar o nome de usuário!"}, uniqueness: {message: "Nome de usuário não está disponível!"}
    validate :dateCheck
    validates :email, confirmation: { case_sensitive: true, message: "Email e Confirmar Email não correspondem!"}, presence: {message: "É obrigatório informar o email!"},format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de Email Inválido!"}
    validates :password, confirmation: { case_sensitive: true, message: "Senha e Confirmar Senha não correspondem!"}, presence: {message: "É obrigatório informar a senha!"}, on: :create

    def dateCheck()
        if self.birth_date
            errors.add(:birthdate, 'É obrigatório ser maior de idade para usar a plataforma!') if self.birth_date > (Date.today - 18.years)
          end
    end

end
