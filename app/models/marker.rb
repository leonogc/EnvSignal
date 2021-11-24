class Marker < ApplicationRecord
    belongs_to :user
    validates :disaster_type, presence: {message: "É necessário informar o tipo de desastre corrente!"}
    validates :latitude, presence: {message: "É obrigatório informar a Latitude!"}
    validates :longitude, presence: {message: "É obrigatório informar a Longitude!"}
    validates :severity, absence: {message: "The marker is not verified!"}, unless: -> { verified? }

    def upvotes
        Voter.where(marker_id: self.id, vote: :upvote).length()
    end

    def downvotes
        Voter.where(marker_id: self.id, vote: :downvote).length()
    end

    scope :general, -> (userId) { where('user_id != ?', userId) }
    scope :own_user, -> (userId) { where('user_id = ?', userId) }
    scope :pending_marker, -> (userId) { where('verified != ? AND user_id != ?', true, userId)  }
    scope :verified_marker, -> (userId) { where('verified = ? AND user_id != ?', true, userId) }

    enum severity: {I: 1, II: 2, III: 3, IV: 4}
end