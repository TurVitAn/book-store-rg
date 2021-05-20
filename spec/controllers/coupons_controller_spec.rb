RSpec.describe CouponsController, type: :controller do
  let(:cart) { create(:cart) }
  let(:coupon) { create(:coupon) }

  describe '#update' do
    before { patch :update, params: params }

    context 'with valid params' do
      let(:params) { { coupon: { code: coupon.code } } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('coupons.update.success')) }
    end
  end
end
