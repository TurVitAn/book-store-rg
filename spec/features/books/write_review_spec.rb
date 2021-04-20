RSpec.describe 'WriteReview', type: :feature do
  let(:book) { create(:book) }
  let(:book_page) { Pages::Book.new }

  before { book_page.load(id: book.id) }

  it { expect(book_page).to have_current_path(book_path(book)) }

  it { expect(book_page.write_review).to be_all_there }
end
