RSpec.describe 'WriteReview', type: :feature do
  let_it_be(:user) { create(:user) }
  let_it_be(:book) { create(:book) }
  let(:book_page) { Pages::Books::Book.new }

  before do
    login_as(user, scope: :user)
    book_page.load(id: book.id)
  end

  describe 'write_review partial' do
    context 'with page elements' do
      it { expect(book_page.write_review).to have_form_header }
      it { expect(book_page.write_review).to have_title_field }
      it { expect(book_page.write_review).to have_text_field }
      it { expect(book_page.write_review).to have_post_button }
    end

    context 'when submit form with invalid title' do
      let(:review_params) { attributes_for(:review, title: '') }

      before { book_page.write_review.submit(review_params) }

      it { expect(book_page).not_to have_content(I18n.t('notice.review.created')) }
      it { expect(book_page).to have_content(I18n.t('alert.blank')) }
    end

    context 'when submit form with invalid text' do
      let(:review_params) { attributes_for(:review, text: '') }

      before { book_page.write_review.submit(review_params) }

      it { expect(book_page).not_to have_content(I18n.t('notice.review.created')) }
      it { expect(book_page).to have_content(I18n.t('alert.blank')) }
    end
  end
end
