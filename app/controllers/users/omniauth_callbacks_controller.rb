module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      handle_auth t('.google')
    end

    def facebook
      handle_auth t('.facebook')
    end

    def handle_auth(kind)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      @user.persisted? ? authenticate_user(kind) : registrate_user
    end

    def failure
      redirect_to root_path, alert: t('.alert')
    end

    private

    def authenticate_user(kind)
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect(@user, event: :authentication)
    end

    def registrate_user
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end
