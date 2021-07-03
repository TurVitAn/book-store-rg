module Checkouts
  class PaymentService
    def initialize(params:, user:, order:)
      @params = params
      @user = user
      @order = order
      @credit_card_form = CreditCardForm.new(params[:credit_card])
      @errors = {}
    end

    def call
      credit_card_form.valid? ? persist_card : collect_errors

      errors.empty?
    end

    def presenter
      PaymentPresenter.new(errors: errors)
    end

    private

    attr_reader :params, :user, :order, :credit_card_form, :errors

    def persist_card
      return order.create_credit_card(params[:credit_card]) unless order.credit_card

      order.credit_card.update(params[:credit_card])
    end

    def collect_errors
      @errors = credit_card_form.errors
    end
  end
end
