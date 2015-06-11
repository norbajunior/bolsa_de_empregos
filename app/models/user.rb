class User < ActiveRecord::Base
  include DefaultScope

  attr_accessor :current_password

  has_secure_password

  mount_uploader :photo, PhotoUploader

  has_enumeration_for :place, with: Concelhos, create_scopes: true

  has_many :interests, foreign_key: :interested_id
  has_many :interested, class_name: 'Interest', foreign_key: :user_id

  scope :by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :place, ->(place) { where(place: place) }

  validates :password, confirmation: true, on: :update
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name,
            :email,
            :photo,
            :address,
            :place,
            :zipcode,
            :contact,
            :presentation, presence: true

  def entity?
    type == 'Entity'
  end

  def candidate?
    type == 'Candidate'
  end
end
