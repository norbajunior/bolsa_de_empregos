class User < ActiveRecord::Base
  has_secure_password

  has_many :interests, foreign_key: :interested_id
  has_many :interested, class_name: 'Interest', foreign_key: :user_id

  def candidate?
    type == 'Candidate'
  end

  def entity?
    type == 'Entity'
  end
end
