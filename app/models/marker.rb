class Marker < ApplicationRecord
    belongs_to :user
    # validates :disaster_type, presence: {message: "É necessário informar o tipo de desastre corrente!"}
    # validates :latitude, :length: {minimum:-90, maximum:90}, presence: {message: "Latitude inválida!"}
    # validates :longitude, :length: {minimum:-180, maximum:180}, presence: {message: "Longitude inválida!"}
    # validates :created_by
    # validate :upvotesCheck
    # validate :downvotesCheck
    # validate :verifiedCheck

    # def upvotesCheck()
    #     if self.upvotes != 0
    #         errors.add(:upvotes, 'A quantidade inicial de votos positivos precisa ser igual a 0!')
    #     end
    # end

    # def downvotesCheck()
    #     if self.downvotes != 0
    #         errors.add(:downvotes, 'A quantidade inicial de votos negativos precisa ser igual a 0!')
    #     end
    # end

end