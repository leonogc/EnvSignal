class Authority < ApplicationRecord

    has_secure_password validations: false
    validates :name, presence: {message: "You need to enter your name!"}
    validates :identifier, presence: {message: "You need to enter your identifier!"}, uniqueness: {message: 'Identifier not available!'}
    validates :password, presence: {message: "You need to enter your password!"}, on: :create
end
