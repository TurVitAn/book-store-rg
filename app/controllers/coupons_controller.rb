class CouponsController < ApplicationController
  def update
    service = Orders::CouponService.new(coupon_params, current_order)
    service.call ? flash[:notice] = t('.update.success') : flash[:alert] = service.errors.full_messages.to_sentence

    redirect_to(cart_path)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
