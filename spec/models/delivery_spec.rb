RSpec.describe Delivery, type: :model do
  describe 'with associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end
end
