class Entity < User
  has_enumeration_for :professional_activity

  has_many :offers, dependent: :destroy
  has_many :candidates, through: :interests, source: :user
  has_many :interested_candidates, through: :interested, source: :interested

  scope :professional_activity, ->(value) { where(professional_activity: value) }
end
