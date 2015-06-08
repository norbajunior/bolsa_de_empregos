class Entity < User
  has_enumeration_for :professional_activity, create_scopes: true

  has_many :offers, dependent: :destroy
  has_many :candidates, through: :interests, source: :user
  has_many :interested_candidates, through: :interested, source: :interested
end
