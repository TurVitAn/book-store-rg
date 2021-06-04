RSpec.describe Order, type: :model do
  subject(:order) { described_class.new }

  describe 'with associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to belong_to(:delivery).optional }
    it { is_expected.to have_one(:coupon).dependent(:nullify) }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
  end

  describe 'with enum for status' do
    it {
      expect(order).to define_enum_for(:status)
        .with_values(pending: 0, address: 1, delivery: 2, payment: 3, confirm: 4, complete: 5)
    }
  end
end
