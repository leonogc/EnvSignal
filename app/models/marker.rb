class Marker < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :authority, optional: true

    validates :disaster_type, presence: {message: "É necessário informar o tipo de desastre corrente!"}
    validates :latitude, presence: {message: "É obrigatório informar a Latitude!"}
    validates :longitude, presence: {message: "É obrigatório informar a Longitude!"}
    validates :severity, absence: {message: "The marker is not verified!"}, unless: -> { verified? }
    validates :user_type, presence: {message: "Marker with no user_type!"}

    validate :checkAuthor

    def checkAuthor()
        if (self.user_id == nil)
            errors.add(:user_id, 'É obrigatório ter um autor valido!')
        elsif (self.user_type == 'userType')
            if ((User.find_by(id: self.user_id)) == nil)
                errors.add(:user_id, 'É obrigatório ter um autor valido!')
            end
        elsif (self.user_type == 'authorityType')
            if ((Authority.find_by(identifier: self.user_id)) == nil)
                errors.add(:user_id, 'É obrigatório ter um autor valido!')
            end
        end
    end

    def upvotes
        Voter.where(marker_id: self.id, vote: :upvote).length()
    end

    def downvotes
        Voter.where(marker_id: self.id, vote: :downvote).length()
    end

    enum severity: {I: 1, II: 2, III: 3, IV: 4}

    scope :own_user, -> (userId, userType) { where('user_id = ? AND user_type = ?',userId, userType) }
    scope :pending_marker, -> (userId, userType) { where('verified != ? AND ((user_id = ? AND user_type != ?) OR user_id != ?)', true, userId, userType, userId)}
    scope :verified_marker, -> (userId, userType) { where('verified = ? AND ((user_id = ? AND user_type != ?) OR user_id != ?)', true, userId, userType, userId)}

    scope :pending_marker_nouser, -> () { where('verified != ?', true)  }
    scope :verified_marker_nouser, -> () { where('verified = ?', true) }

    enum user_type: {userType: 0, authorityType: 1}
end