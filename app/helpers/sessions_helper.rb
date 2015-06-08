module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def entity?
    current_user.type == 'Entity'
  end

  def candidate?
    current_user.type == 'Candidate'
  end

  def backoffice?
    logged_in? && current_user.backoffice?
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)

    @current_user = nil
  end

  alias :current_entity :current_user
  alias :current_candidate :current_user
end
