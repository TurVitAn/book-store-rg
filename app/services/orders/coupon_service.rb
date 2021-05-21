module Orders
  class CouponService
    attr_reader :errors

    def initialize(params, order)
      @coupon_form = CouponForm.new(params)
      @order = order
    end

    def call
      if coupon_form.invalid?
        @errors = coupon_form.errors
      else
        coupon = Coupon.find_by(code: coupon_form.code)
        coupon.update(order: order)
      end

      errors.blank?
    end

    private

    attr_reader :order, :coupon_form
  end
end
