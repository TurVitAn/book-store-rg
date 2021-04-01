RSpec.describe Author, type: :model do
  xit { is_expected.to have_many(:author_books).dependent(:destroy) }
  xit { is_expected.to have_many(:books).through(:author_books).dependent(:destroy) }
end
