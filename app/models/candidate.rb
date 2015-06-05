class Candidate < User
  with_options create_scopes: true do |c|
    c.has_enumeration_for :employment_status
    c.has_enumeration_for :professional_area
    c.has_enumeration_for :scholarity
  end

  has_many :entities, through: :interests, source: :user
  has_many :interested_entities, through: :interested, source: :interested
end
