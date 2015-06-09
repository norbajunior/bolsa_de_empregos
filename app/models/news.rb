class News < ActiveRecord::Base
  belongs_to :user # backoffice

  mount_uploader :image, PhotoUploader

  validates :title, :date, :summary, :text, :image, presence: true
end
