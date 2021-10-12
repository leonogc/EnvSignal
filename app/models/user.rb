class User < ApplicationRecord
    validates :name, presence: {message: "É obrigatório informar o nome!"}
    validates :birth_date, presence: {message: "É obrigatório informar a data de nascimento!"}
    validates :username, presence: {message: "É obrigatório informar o nome de usuário!"}
    validate :dateCheck
    validates :email, confirmation: true, presence: {message: "É obrigatório informar o email!"},format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de Email Inválido!"}
    validates :password, confirmation: true, presence: {message: "É obrigatório informar a senha!"}
    validates :password, confirmation: { case_sensitive: true, message: "Senha e Confirmar Senha não correspondem!"}
    validates :email, confirmation: { case_sensitive: true, message: "Email e Confirmar Email não correspondem!"}
    validate :usernameAvailableCheck

    def dateCheck()
        if self.birth_date
            errors.add(:birthdate, 'É obrigatório ser maior de idade para usar a plataforma!') if self.birth_date > (Date.today - 18.years)
          end
    end

    def usernameAvailableCheck()
        errors.add(:username, 'Nome de usuário não está disponível!') if User.find_by username: self.username
    end

end

# numericality: {less_than: (Date.today - 18.years), message: "É obrigatório ser maior de idade para usar a plataforma!"}
