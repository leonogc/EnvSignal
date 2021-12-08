class User < ApplicationRecord
    
    has_secure_password
    validates :name, presence: {message: "You need to enter your name!"}
    validates :birth_date, presence: {message: "You need to enter your birthdate!"}
    validates :username, presence: {message: "You need to enter your username!"}, uniqueness: {message: "Username not available!"}
    validate :dateCheck
    validates :email, confirmation: { case_sensitive: true, message: "Email and Confirmation don't match!"}, presence: {message: "You need to enter your email!"},format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid Email Format!"}
    validates :password, confirmation: { case_sensitive: true, message: "Password and Confirmation don't match!"}, presence: {message: "You need to enter your password!"}, on: :create

    def dateCheck()
        if self.birth_date
            errors.add(:birthdate, 'You need to be over 18 to use the platform!') if self.birth_date > (Date.today - 18.years)
          end
    end

end
