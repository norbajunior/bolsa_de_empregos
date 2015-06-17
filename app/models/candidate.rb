class Candidate < User
  include SharedUserValidations

  has_enumeration_for :employment_status
  has_enumeration_for :professional_area
  has_enumeration_for :scholarity

  mount_uploader :cv, FileUploader

  has_many :entities, through: :interests, source: :user
  has_many :interested_entities, through: :interested, source: :interested
  has_many :applications, dependent: :restrict_with_exception
  has_many :applied_offers, through: :applications, source: :offer

  validates :date_of_birth, timeliness: { on_or_before: -> { 15.years.ago }, type: :date }, allow_blank: true
  validates :date_of_birth, :professional_area, :scholarity, :employment_status, presence: true
  validates :identity_number, numericality: { only_integer: true }, length: { maximum: 15 }, allow_blank: true
  validates :cv, file_size: { less_than: 4.megabytes }, allow_blank: true

  %i[employment_status professional_area scholarity].each do |name|
    scope name, ->(value) { where(name => value) }
  end

  def has_already_applied_for(offer_id)
    applications.find_by offer_id: offer_id
  end
end
