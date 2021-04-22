class AddressesController < ApplicationController
  before_action :authenticate_user!

  ADDRESS_ATTRIBUTES = %w[first_name last_name address address_type city zip_code country phone].freeze

  def create
    service = AddressService.new(user: current_user, params: address_params)
    if service.call
      redirect_to(settings_path, notice: t('.success'))
    else
      @presenter = SettingsPresenter.new(current_user, address_params, service.errors)
      render 'settings/index'
    end
  end

  private

  def address_params
    params.require(:address).permit(ADDRESS_ATTRIBUTES.map(&:to_sym))
  end
end
