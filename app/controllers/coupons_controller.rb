class CouponsController < ApplicationController
  def update
    service = Carts::CouponService.new(coupon_params, current_cart)
    if service.call
      flash[:notice] = t('.success')
    else
      presenter = CouponPresenter.new(errors: service.errors)
      flash[:alert] = presenter.errors
    end
    redirect_to(carts_path)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
