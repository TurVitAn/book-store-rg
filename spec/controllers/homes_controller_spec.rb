RSpec.describe HomesController, type: :controller do
  before do
    stub_const('NEWEST_BOOKS_COUNT', 3)
    get :index
  end

  describe 'GET /' do
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }

    context 'with assigns' do
      it 'assigns @newest_books' do
        expect(assigns[:newest_books]).to eq(Book.includes(:authors).last(NEWEST_BOOKS_COUNT))
      end
    end
  end

  describe 'GET /privacy_policy' do
    before { get :privacy_policy }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:privacy_policy) }
  end
end
