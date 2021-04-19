RSpec.describe Address, type: :model do
  describe 'with enum for address_type' do
    it { is_expected.to define_enum_for(:address_type).with_values(billing: 0, shipping: 1) }
  end

  describe 'with associations' do
    it { is_expected.to belong_to(:addressable) }
  end
end
