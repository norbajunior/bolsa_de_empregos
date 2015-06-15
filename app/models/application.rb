class Application < ActiveRecord::Base
  belongs_to :offer
  belongs_to :candidate, class_name: 'User'

  validates :offer_id, :candidate_id, presence: true
  validates :offer_id, uniqueness: { scope: :candidate_id }
end
