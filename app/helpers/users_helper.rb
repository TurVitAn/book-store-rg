module UsersHelper
  def username
    @username ||= current_user.email.split(/@/).first
  end
end
