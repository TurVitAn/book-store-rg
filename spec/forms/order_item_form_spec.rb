RSpec.describe OrderItemForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(OrderItemForm::INVALID_QUANTITY) }
  end
end
