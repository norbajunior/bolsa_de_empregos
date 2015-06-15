class News < ActiveRecord::Base
  include DefaultScope

  belongs_to :user # backoffice

  mount_uploader :image, PhotoUploader

  validates :date, timeliness: { type: :date }, allow_blank: true
  validates :title, :date, :summary, :text, :image, presence: true

  scope :title, ->(title) { where('title ILIKE ?', "%#{title}%") }
  scope :active, -> { where(active: true) }
end
