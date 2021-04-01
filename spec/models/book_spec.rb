RSpec.describe Book, type: :model do
  context 'with associations' do
    xit { is_expected.to have_many(:author_books).dependent(:destroy) }
    xit { is_expected.to have_many(:books).through(:author_books).dependent(:destroy) }
  end

  context 'with validations' do
    subject(:book) { create(:book) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }

    it 'description min size' do
      stub_const('MIN_DESCRIPTION_SIZE', 50)
      expect(book).to validate_length_of(:description).is_at_least(MIN_DESCRIPTION_SIZE)
    end
  end
end
