class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :photo, PhotoUploader

  has_enumeration_for :place, with: Concelhos, create_scopes: true

  has_many :interests, foreign_key: :interested_id
  has_many :interested, class_name: 'Interest', foreign_key: :user_id

  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :place, ->(place) { where(place: place) }
end
