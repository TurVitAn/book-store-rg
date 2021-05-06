RSpec.describe Author do
  context 'with associations' do
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
    it { is_expected.to have_many(:books).through(:author_books).dependent(:destroy) }
  end
end
