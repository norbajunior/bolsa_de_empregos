class Candidate < User
  has_many :entities, through: :interests, source: :interested
  has_many :interested_entities, through: :interested, source: :user
end
