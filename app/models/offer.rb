class Offer < ActiveRecord::Base
  has_enumeration_for :professional_activity
  has_enumeration_for :salary
  has_enumeration_for :contract

  mount_uploader :photo, PhotoUploader

  belongs_to :entity

  validates :title, :start_at, :end_at, :description, presence: true

  delegate :name, to: :entity, prefix: true

  scope :title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  scope :similar_offers, ->(offer) do
    where(professional_activity: offer.professional_activity).
    where.not(id: offer.id).
    limit(4).
    order('RANDOM()')
  end

  scope :place, ->(place) do
    joins(:entity).where entities: { place: place }
  end

  %i[professional_activity salary contract].each do |name|
    scope name, ->(value) { where(name => value) }
  end
end
