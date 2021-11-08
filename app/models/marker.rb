class Marker < ApplicationRecord
    belongs_to :user
    validates :disaster_type, presence: {message: "É necessário informar o tipo de desastre corrente!"}
    validates :latitude, presence: {message: "É obrigatório informar a Latitude!"}
    validates :longitude, presence: {message: "É obrigatório informar a Longitude!"}
    validate :upvotesCheck
    validate :downvotesCheck

    def upvotesCheck()

         if defined?(self.upvotes) == nil || self.upvotes != 0
             errors.add(:upvotes, 'A quantidade inicial de votos positivos precisa ser igual a 0!')
         end
     end

     def downvotesCheck()
         if defined?(self.downvotes) == nil || self.downvotes != 0
             errors.add(:downvotes, 'A quantidade inicial de votos negativos precisa ser igual a 0!')
         end
     end

    scope :general, ->(userId) { where('user_id != ?', userId) }
    scope :own_user, ->(userId) { where('user_id = ?', userId) }
end