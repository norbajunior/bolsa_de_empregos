class Entity < User
  has_many :candidates, through: :interests, source: :user
  has_many :interested_candidates, through: :interested, source: :interested
end
