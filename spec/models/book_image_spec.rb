RSpec.describe BookImage, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:book) }
  end
end
