class Backoffice < User
  DEFAULT_PASSWORD = '123456'

  validates :name, :email, presence: true, on: :backoffice_update,
                                           on: :backoffice_create

  before_validation :set_default_password, on: :backoffice_create

  private

  def set_default_password
    self.password = DEFAULT_PASSWORD
    self.password_confirmation = DEFAULT_PASSWORD
  end
end
