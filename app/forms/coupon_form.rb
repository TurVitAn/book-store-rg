class CouponForm
  include ActiveModel::Model

  attr_accessor :code

  validates :code, presence: true
  validate :coupon_is_not_exists
  validate :coupon_is_used, if: :coupon
  validate :coupon_is_invalid, if: :coupon

  private

  def coupon
    @coupon ||= Coupon.find_by(code: code)
  end

  def coupon_is_not_exists
    errors.add(:code, t('coupons.alert.not_exist')) unless coupon
  end

  def coupon_is_used
    errors.add(:code, t('coupons.alert.used')) if coupon.order
  end

  def coupon_is_invalid
    errors.add(:code, t('coupons.alert.invalid')) unless coupon.is_valid
  end
end
