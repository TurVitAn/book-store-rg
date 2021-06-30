RSpec.describe Order, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_one(:coupon).dependent(:nullify) }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
  end
end
