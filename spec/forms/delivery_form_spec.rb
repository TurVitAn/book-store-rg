RSpec.describe DeliveryForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:from_days) }
    it { is_expected.to validate_presence_of(:to_days) }
    it { is_expected.to validate_numericality_of(:from_days).only_integer }
    it { is_expected.to validate_numericality_of(:to_days).only_integer }
  end
end
