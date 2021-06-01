RSpec.describe CheckoutController, type: :controller do
  describe 'GET /' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
