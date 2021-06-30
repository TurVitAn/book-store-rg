RSpec.describe CouponsController, type: :controller do
  let(:cart) { create(:order) }
  let(:coupon) { create(:coupon) }

  describe '#update' do
    before { patch :update, params: params }

    context 'with invalid params' do
      let(:fake_code) { rand(0..9) }
      let(:params) { { coupon: { code: fake_code } } }
      let(:form) { CouponForm.new(params[:coupon]) }

      before { form.validate }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has alert flash' do
        expect(flash[:alert]).to eq(form.errors.full_messages_for(:code).to_sentence)
      end
    end

    context 'with valid params' do
      let(:params) { { coupon: { code: coupon.code } } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('coupons.update.success')) }
    end
  end
end
