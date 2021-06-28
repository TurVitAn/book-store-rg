module Users
  class PasswordsController < Devise::RegistrationsController
    before_action :authenticate_user!

    def update
      update_resource(resource, account_update_params) ? send_successful_response : send_fail_response
    end

    private

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
