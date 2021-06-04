module Checkouts
  class UpdateService
    attr_reader :checkout_presenter

    SERVICES = {
      address: Checkouts::AddressService,
      delivery: Checkouts::DeliveryService
    }.freeze

    STEPS = {
      address: ->(order) { order.delivery! },
      delivery: ->(order) { order.payment! },
      payment: ->(order) { order.confirm! },
      confirm: ->(order) { order.complete! }
    }.freeze

    def initialize(params:, user:, order:)
      @params = params
      @user = user
      @order = order
    end

    def call
      service = SERVICES[params[:step].to_sym].new(params: params, user: user, order: order)
      return true if service.call

      @checkout_presenter = service.presenter
      false
    end

    def next_step
      STEPS[params[:step].to_sym].call(order) if params[:step] == order.status
      order.status
    end

    private

    attr_reader :params, :user, :order
  end
end
