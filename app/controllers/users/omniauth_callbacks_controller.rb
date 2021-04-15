module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      @user.persisted? ? authenticate_user : registrate_user
    end

    def failure
      redirect_to root_path, alert: 'Failure. Please try again'
    end

    private

    def authenticate_user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      sign_in_and_redirect(@user, event: :authentication)
    end

    def registrate_user
      session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_path, alert: @user.errors.full_messages.join("\n")
    end
  end
end
