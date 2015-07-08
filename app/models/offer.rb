class Offer < ActiveRecord::Base
  extend Searchable
  include DefaultScope

  has_enumeration_for :professional_activity
  has_enumeration_for :salary
  has_enumeration_for :contract

  mount_uploader :photo, PhotoUploader

  belongs_to :entity

  has_many :applications, dependent: :restrict_with_exception
  has_many :candidates, through: :applications

  validates :photo, file_size: { less_than: 1.megabyte }
  validates :end_at, timeliness: { on_or_after: :start_at, type: :date }, allow_blank: true
  validates :start_at, timeliness: { type: :date }, allow_blank: true
  validates :title,
            :start_at,
            :end_at,
            :description,
            :photo,
            :professional_activity,
            :contract, presence: true

  delegate :name, to: :entity, prefix: true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  scope :query, ->(query) do
    joins(:entity).
    where('offers.title ILIKE ? OR users.name ILIKE ?', "%#{query}%", "%#{query}%")
  end

  scope :similar_offers, ->(offer) do
    where(professional_activity: offer.professional_activity).
    where.not(id: offer.id).
    active
  end

  scope :place, ->(place) do
    joins(:entity).where(users: { place: place })
  end

  %i[professional_activity salary contract].each do |name|
    scope name, ->(value) { where(name => value) }
  end

  scope :featured, -> do
    select('offers.*, count(applications.offer_id) AS count_applications').
    joins(:applications).
    group('offers.id').
    order('count_applications DESC').
    active
  end
end
