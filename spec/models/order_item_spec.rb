RSpec.describe OrderItem, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end
end
