class Candidate < User
  has_enumeration_for :employment_status
  has_enumeration_for :professional_area
  has_enumeration_for :scholarity

  mount_uploader :cv, FileUploader
  
  has_many :entities, through: :interests, source: :user
  has_many :interested_entities, through: :interested, source: :interested

  %i[employment_status professional_area scholarity].each do |name|
    scope name, ->(value) { where(name => value) }
  end
end
