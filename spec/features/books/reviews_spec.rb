RSpec.describe 'Reviews', type: :feature do
  let_it_be(:user) { create(:user) }
  let_it_be(:book) { create(:book) }
  let(:book_page) { Pages::Books::Book.new }

  before do
    login_as(user, scope: :user)
    book_page.load(id: book.id)
  end

  describe 'reviews partial' do
    let_it_be(:review) { create(:review, book: book, user: user).decorate }

    context 'with page elements' do
      it { expect(book_page.reviews).to have_reviews }
      it { expect(book_page.reviews).to have_reviewers_names }
      it { expect(book_page.reviews).to have_reviewers_messages }
      it { expect(book_page.reviews).to have_content(review.text) }
      it { expect(book_page.reviews).to have_content(review.username) }
      it { expect(book_page.reviews).to have_content(review.creation_date) }
    end
  end
end
