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
  scope :type, ->(type) { where(type: type) }

  with_options on: :create, on: :update do |u|
    u.validates :site, url: true
    u.validates :password, confirmation: true
    u.validates :name,
                :photo,
                :address,
                :place,
                :zipcode,
                :contact,
                :presentation, presence: true
  end

  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  def entity?
    type == 'Entity'
  end

  def candidate?
    type == 'Candidate'
  end

  def backoffice?
    type == 'Backoffice'
  end

  def already_interested_in(user_id)
    interests.find_by user_id: user_id
  end
end
