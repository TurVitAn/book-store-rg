RSpec.describe 'Reviews', type: :feature do
  let(:book) { create(:book) }
  let(:book_page) { Pages::Books::Book.new }

  before { book_page.load(id: book.id) }

  describe 'reviews partial' do
    context 'with page elements' do
      it { expect(book_page.reviews).to have_reviews }
      it { expect(book_page.reviews).to have_reviewers_names }
      it { expect(book_page.reviews).to have_reviewers_messages }
    end
  end
end
