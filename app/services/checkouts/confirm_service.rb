module Checkouts
  class ConfirmService
    NUMBER_BEGIN = '#Rg'.freeze
    NUMBER_RANGE = (0..9)
    NUMBER_SIZE = 8

    def initialize(params:, user:, order:)
      @params = params
      @user = user
      @order = order
    end

    def call
      order.update(number: generate_order_number)
      OrderMailer.thank_for_order(user.email).deliver_later
    end

    private

    attr_reader :params, :user, :order

    def generate_order_number
      NUMBER_BEGIN + Array.new(NUMBER_SIZE) { rand(NUMBER_RANGE) }.join
    end
  end
end
