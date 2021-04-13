RSpec.describe AuthorBook do
  context 'with associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:book) }
  end
end
