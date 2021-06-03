class CheckoutsController < ApplicationController
  def show
    service = Checkouts::ShowService.new(params: params, user: current_user, order: current_order)

    @checkout_presenter = service.call
    @order = current_order.decorate
  end

  def update
    service = Checkouts::UpdateService.new(params: params.permit!, user: current_user, order: current_order)
    return redirect_to checkout_path(step: service.next_step) if service.call

    @checkout_presenter = service.presenter
    @order = current_order.decorate
    render :show
  end
end
