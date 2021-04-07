RSpec.describe PagesController, type: :controller do
  before do
    stub_const('NEWEST_BOOKS_COUNT', 3)
    get :index
  end

  describe 'GET /' do
    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    context 'with assigns' do
      it 'assigns @newest_books' do
        expect(assigns[:newest_books]).to eq(Book.includes(:authors).last(NEWEST_BOOKS_COUNT))
      end
    end
  end
end
