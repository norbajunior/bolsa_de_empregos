class Candidate < User
  has_many :entities, through: :interests, source: :user
  has_many :interested_entities, through: :interested, source: :interested
end
