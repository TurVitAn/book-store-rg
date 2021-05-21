RSpec.describe Coupon, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:order).optional }
  end
end
