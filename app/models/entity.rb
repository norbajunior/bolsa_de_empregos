class Entity < User
  include SharedUserValidations

  has_enumeration_for :professional_activity

  has_many :offers, dependent: :destroy
  has_many :candidates, through: :interests, source: :user
  has_many :interested_candidates, through: :interested, source: :interested

  validates :professional_activity, :nif, presence: true
  validates :nif, length: { is: 9 },
                  numericality: { only_integer: true },
                  uniqueness: true

  scope :professional_activity, ->(value) { where(professional_activity: value) }
end
