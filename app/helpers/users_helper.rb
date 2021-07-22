module UsersHelper
  def username
    @username ||= current_user.email.split(/@/).first
  end

  def sign_up?
    controller_name != 'sessions'
  end

  def log_in?
    devise_mapping.registerable? && controller_name != 'registrations'
  end

  def confirmation_instructions?
    devise_mapping.confirmable? && controller_name != 'confirmations'
  end
end
