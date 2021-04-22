class AddressesController < ApplicationController
  before_action :authenticate_user!
  helper_method :resource_name, :resource, :devise_mapping

  ADDRESS_ATTRIBUTES = %w[first_name last_name address address_type city zip_code country phone].freeze

  def create
    service = AddressService.new(user: current_user, params: address_params)
    service.call
    if service.success
      redirect_to(edit_user_registration_path, notice: t('.success'))
    else
      set_addresses
      render 'settings/index'
    end
  end

  def update
    service = SaveAddressService.new(user: current_user, params: address_params, id: params[:id])
    service.call
    if service.success
      redirect_to(edit_user_registration_path, notice: t('.success'))
    else
      set_addresses
      render 'settings/index'
    end
  end

  private

  def address_params
    params.require(:address).permit(ADDRESS_ATTRIBUTES.map(&:to_sym)).merge(addressable: current_user)
  end

  def set_addresses
    @billing_address = current_user.billing_address || Address.new
    @shipping_address = current_user.shipping_address || Address.new
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
