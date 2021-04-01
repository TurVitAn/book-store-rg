RSpec.describe Category, type: :model do
  context 'with associations' do
    xit { is_expected.to have_many(:books).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
