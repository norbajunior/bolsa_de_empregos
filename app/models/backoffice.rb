class Backoffice < User
  DEFAULT_PASSWORD = '123456'

  before_validation :set_default_password, on: :create

  private

  def set_default_password
    self.password = DEFAULT_PASSWORD
    self.password_confirmation = DEFAULT_PASSWORD
  end
end
