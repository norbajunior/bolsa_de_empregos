class Entity < User
  has_many :candidates, through: :interests, source: :interested
  has_many :interested_candidates, through: :interested, source: :user
end
