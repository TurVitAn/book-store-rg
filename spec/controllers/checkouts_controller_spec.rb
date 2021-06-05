RSpec.describe CheckoutsController, type: :controller do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  before { sign_in(order.user) }

  describe '#show' do
    before { get :show, params: params }

    context 'when step is address' do
      let(:params) { { step: :address } }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end

    context 'when step is delivery' do
      let(:params) { { step: :delivery } }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end

    context 'when step is payment' do
      let(:params) { { step: :payment } }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end
  end

  describe '#update' do
    before { patch :update, params: params }

    context 'when step is address and params are invalid' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address, city: ''),
          shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end

    context 'when step is address and params are valid' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address), shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it { expect(response).to have_http_status(:redirect) }
    end

    context 'when step is delivery and params are valid' do
      let(:params) { { step: step, delivery_id: delivery.id } }
      let(:step) { :delivery }
      let(:delivery) { create(:delivery) }

      it { expect(response).to have_http_status(:redirect) }
    end

    context 'when step is payment and params are invalid' do
      let(:params) { { step: step, credit_card: card_params } }
      let(:step) { :payment }
      let(:card_params) { attributes_for(:credit_card, cvv: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end

    context 'when step is payment and params are valid' do
      let(:params) { { step: step, credit_card: card_params } }
      let(:step) { :payment }
      let(:card_params) { attributes_for(:credit_card) }

      it { expect(response).to have_http_status(:redirect) }
    end
  end
end
