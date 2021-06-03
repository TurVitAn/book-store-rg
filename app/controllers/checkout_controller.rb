class CheckoutController < ApplicationController
  def show
    service = Checkout::ShowService.new(params: params, user: current_user, order: current_order)

    @chekout_presenter = service.call
    @order = current_order.decorate
  end

  def update
    service = Checkout::UpdateService.new(params: params.permit!, user: current_user, order: current_order)
    return redirect_to checkout_path(step: service.next_step) if service.call

    @chekout_presenter = service.presenter
    @order = current_order.decorate
    render :show
  end
end
