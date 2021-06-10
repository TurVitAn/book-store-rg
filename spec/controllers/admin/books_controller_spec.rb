RSpec.describe Admin::BooksController, type: :controller do
  let(:admin) { create(:admin_user) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }

  before { sign_in(admin) }

  describe 'POST create' do
    before { post :create, params: { book: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:book, title: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/new') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:book, category_id: category.id, author_ids: [author.id]) }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(admin_books_path) }
    end
  end

  describe 'PUT update' do
    let(:book) { create(:book) }

    before { put :update, params: { id: book.id, book: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:book, title: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/edit') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:book, category_id: category.id, author_ids: [author.id]) }

      it { expect(response).to redirect_to(admin_books_path) }
      it { expect(response).to have_http_status(:redirect) }
    end
  end
end
