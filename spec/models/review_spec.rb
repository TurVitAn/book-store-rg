RSpec.describe Review, type: :model do
  describe 'with enum for status' do
    it { is_expected.to define_enum_for(:status).with_values(unprocessed: 0, approved: 1, rejected: 2) }
  end

  describe 'with associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end
end
