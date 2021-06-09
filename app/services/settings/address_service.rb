module Settings
  class AddressService
    attr_reader :errors

    def initialize(user:, params:)
      @user = user
      @form = AddressForm.new(params)
      @params = params.merge(addressable: user)
      @errors = {}
    end

    def call
      form.valid? ? save_address : @errors = form.errors

      errors.blank?
    end

    private

    attr_reader :user, :params, :form

    def address
      @address ||= Address.find_by(addressable_id: user.id, address_type: params[:address_type])
    end

    def save_address
      address ? address.update(params) : Address.create(params)
    end
  end
end
