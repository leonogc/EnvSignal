class Voter < ApplicationRecord
  belongs_to :user
  belongs_to :marker

  enum vote: {upvote: 0, downvote: 1}
end
