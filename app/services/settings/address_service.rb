module Settings
  class AddressService
    attr_reader :errors

    def initialize(user:, params:)
      @user = user
      @form = AddressForm.new(params)
      @params = params.merge(addressable: user)
    end

    def call
      form.valid? ? manage_address : collect_errors
    end

    private

    attr_reader :user, :params, :form

    def collect_errors
      @errors = form.errors || {}
      errors.blank?
    end

    def manage_address
      address.update(params)
    end

    def address
      Address.find_or_initialize_by(addressable_id: user.id, address_type: params[:address_type])
    end
  end
end
