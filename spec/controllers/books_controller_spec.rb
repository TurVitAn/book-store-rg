RSpec.describe BooksController, type: :controller do
  describe 'GET /books' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
  end

  describe 'GET /books/{id}' do
    let(:book) { create(:book) }

    context 'with invalid attributes' do
      before { get :show, params: { id: '' } }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(response).to render_template(:not_found) }
    end

    context 'with valid attributes' do
      before { get :show, params: { id: book.id } }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end
  end
end
