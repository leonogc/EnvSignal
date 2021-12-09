class Marker < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :authority, optional: true

    validates :disaster_type, presence: {message: "You need to enter the disaster's type!"}
    validates :latitude, presence: {message: "You need to enter the latitude!"}
    validates :longitude, presence: {message: "You need to enter the longitude!"}
    validates :severity, absence: {message: "The marker is not verified!"}, unless: -> { verified? }
    validates :user_type, presence: {message: "Marker with no user_type!"}

    validate :checkAuthor

    def checkAuthor()
        if (self.user_id == nil)
            errors.add(:user_id, 'You need a valid creator!')
        elsif (self.user_type == 'userType')
            @res = User.find_by(id: self.user_id)
            if (@res == nil)
                errors.add(:user_id, 'You need a valid creator!')
            end
        elsif (self.user_type == 'authorityType')
            @res = Authority.find_by(id: self.user_id)
            if (@res == nil)
                errors.add(:user_id, 'You need a valid creator!')
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

    scope :own_user, -> (userId, userType) { where('user_id = ? AND user_type = ? AND resolved = ?',userId, userType, false) }
    scope :own_user_verified, -> (userId, userType) { where('verified = ? AND user_id = ? AND user_type = ? AND resolved = ?', true, userId, userType, false) }
    scope :own_user_pending, -> (userId, userType) { where('verified != ? AND user_id = ? AND user_type = ? AND resolved = ?', true, userId, userType, false) }
    scope :pending_marker, -> (userId, userType) { where('verified != ? AND ((user_id = ? AND user_type != ?) OR user_id != ?) AND resolved = ?', true, userId, userType, userId, false)}
    scope :verified_marker, -> (userId, userType) { where('verified = ? AND ((user_id = ? AND user_type != ?) OR user_id != ?) AND resolved = ?', true, userId, userType, userId, false)}

    scope :pending_marker_nouser, -> () { where('verified != ? AND resolved = ?', true, false)  }
    scope :verified_marker_nouser, -> () { where('verified = ? AND resolved = ?', true, false) }

    enum user_type: {userType: 0, authorityType: 1}
end