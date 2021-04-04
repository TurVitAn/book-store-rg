RSpec.describe Author, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
    it { is_expected.to have_many(:books).through(:author_books).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
