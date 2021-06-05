RSpec.describe CartsController, type: :controller do
  describe 'GET /cart' do
    let(:order) { create(:order) }

    before { get :show }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:show) }
  end
end
