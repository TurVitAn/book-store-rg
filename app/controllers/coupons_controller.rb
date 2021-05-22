class CouponsController < ApplicationController
  def update
    service = Orders::CouponService.new(coupon_params, current_order)
    result = service.call ? :notice : :alert
    flash[result] = service.errors.any? ? service.errors.full_messages.to_sentence : t('.success')
    redirect_to(order_path)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
