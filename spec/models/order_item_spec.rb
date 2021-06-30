RSpec.describe OrderItem, type: :model do
  context 'with validations' do
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(OrderItem::INVALID_QUANTITY) }
  end

  describe 'with associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end
end
