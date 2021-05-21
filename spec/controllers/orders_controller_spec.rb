RSpec.describe OrdersController, type: :controller do
  describe 'GET /orders' do
    let(:order) { create(:order) }

    before { get :index }

    it { expect(response).to have_http_status(:success) }
  end
end
