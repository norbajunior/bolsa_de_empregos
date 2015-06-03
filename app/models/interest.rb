class Interest < ActiveRecord::Base
  belongs_to :interested, class_name: 'User'
  belongs_to :user

  validates :interested_id, :user_id, presence: true
  validates :interested_id, uniqueness: { scope: :user_id }
end
