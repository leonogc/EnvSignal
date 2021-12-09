class Admin < ApplicationRecord
    has_secure_password
    validates :username, presence: {message: "You need to enter your username!"}, uniqueness: {message: 'Username not available!'}
end
