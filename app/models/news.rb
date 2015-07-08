class News < ActiveRecord::Base
  extend Searchable
  include DefaultScope

  belongs_to :user # backoffice

  mount_uploader :image, PhotoUploader

  validates :image, file_size: { less_than: 2.megabytes }
  validates :date, timeliness: { type: :date }, allow_blank: true
  validates :title, :date, :summary, :text, :image, presence: true

  scope :title, ->(title) { where('title ILIKE ?', "%#{title}%") }
  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true, active: true) }
end
