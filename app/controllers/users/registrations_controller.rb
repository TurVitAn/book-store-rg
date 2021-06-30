module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!, only: :update

    def create
      params[:user][:quick_register] ? quick_registrate_user : super
    end

    def update
      update_resource(resource, account_update_params) ? send_successful_response : send_fail_response
    end

    private

    def quick_registrate_user
      params[:user][:password] = params[:user][:password_confirmation] = Devise.friendly_token
      build_resource(sign_up_params)
      resource.skip_confirmation!
      resource.save ? authenticate_user : redirect_back_with_errors
    end

    def authenticate_user
      sign_up(resource_name, resource)
      resource.send_reset_password_instructions
      redirect_to(checkout_index_path, notice: I18n.t('devise.passwords.send_instructions'))
    end

    def redirect_back_with_errors
      redirect_back(fallback_location: cart_path, alert: resource.errors.full_messages_for(:email).to_sentence)
    end

    def update_resource(resource, params)
      return super unless params.key?(:email)

      resource.update_without_password(params)
    end

    def send_successful_response
      set_flash_message_for_update(resource, resource.unconfirmed_email)
      bypass_sign_in(resource, scope: resource_name)
      respond_with(resource, location: settings_path)
    end

    def send_fail_response
      flash.alert = t('devise.registrations.update.alert')
      @settings_presenter = SettingsPresenter.new(user: resource)
      render 'settings/index'
    end
  end
end
