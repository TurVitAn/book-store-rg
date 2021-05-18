RSpec.describe Cart, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_one(:coupon).dependent(:destroy) }
  end
end
