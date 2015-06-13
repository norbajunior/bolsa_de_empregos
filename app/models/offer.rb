class Offer < ActiveRecord::Base
  include DefaultScope

  has_enumeration_for :professional_activity
  has_enumeration_for :salary
  has_enumeration_for :contract

  mount_uploader :photo, PhotoUploader

  belongs_to :entity

  has_many :applications, dependent: :restrict
  has_many :candidates, through: :applications

  validates :title,
            :start_at,
            :end_at,
            :description,
            :photo,
            :professional_activity,
            :contract, presence: true

  delegate :name, to: :entity, prefix: true

  scope :title, ->(title) { where('title ILIKE ?', "%#{title}%") }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  scope :similar_offers, ->(offer) do
    where(professional_activity: offer.professional_activity).
    where.not(id: offer.id)
  end

  scope :place, ->(place) do
    joins(:entity).where(users: { place: place })
  end

  %i[professional_activity salary contract].each do |name|
    scope name, ->(value) { where(name => value) }
  end
end
