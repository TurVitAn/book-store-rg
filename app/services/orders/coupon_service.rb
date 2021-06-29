module Orders
  class CouponService
    attr_reader :errors

    def initialize(params, order)
      @coupon_form = CouponForm.new(params)
      @order = order
    end

    def call
      unless coupon_form.valid?
        @errors = coupon_form.errors
        return false
      end

      coupon.update(order: order)
      true
    end

    private

    attr_reader :order, :coupon_form

    def coupon
      @coupon ||= Coupon.find_by(code: coupon_form.code)
    end
  end
end
