RSpec.describe OrdersController, type: :controller do
  let(:order) { create(:order) }

  before { sign_in(order.user) }

  describe 'GET /orders' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
  end

  describe 'GET /orders/{id}' do
    before { get :show, params: { id: id } }

    context 'with invalid id' do
      let(:id) { 0 }

      it { expect(response).to have_http_status(:not_found) }
    end

    context 'with valid id' do
      let(:id) { order.id }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end
  end
end
