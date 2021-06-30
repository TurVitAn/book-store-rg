RSpec.describe CreditCardForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:cvv) }
    it { is_expected.to validate_length_of(:number).is_equal_to(described_class::CARD_NUMBER_SIZE) }
    it { is_expected.to validate_numericality_of(:number).only_integer }
    it { is_expected.to validate_length_of(:cvv).is_equal_to(described_class::CVV_SIZE) }
    it { is_expected.to validate_numericality_of(:cvv).only_integer }
    it { is_expected.to validate_length_of(:name).is_at_most(described_class::NAME_MAX_SIZE) }
  end
end
