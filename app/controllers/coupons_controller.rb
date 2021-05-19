class CouponsController < ApplicationController
  def update
    service = Carts::CouponService.new(coupon_params, @cart)
    if service.call
      flash[:notice] = t('coupons.check.success')
    else
      presenter = CouponPresenter.new(errors: service.errors)
      flash[:alert] = presenter.errors
    end
    redirect_to(cart_path(@cart))
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
