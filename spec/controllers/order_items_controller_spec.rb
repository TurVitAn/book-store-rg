RSpec.describe OrderItemsController, type: :controller do
  let(:book) { create(:book) }

  describe 'POST /order_items' do
    before { post :create, params: { order_item: params } }

    context 'when create new order item' do
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('order_items.create.success')) }
      it { expect(cookies[:order_id].nil?).to be false }
    end

    context 'when update existing order item' do
      let(:order) { create(:order) }
      let(:params) { attributes_for(:order_item, order_id: order.id, book_id: book.id) }
      let(:order_item) { create(:order_item, order_id: order.id, book_id: book.id) }

      before { cookies[:order_id] = order.id }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('order_items.create.success')) }
      it { expect(cookies[:order_id]).to eq(order.id) }
    end
  end

  describe 'PATCH /order_item/{id}' do
    let(:order) { create(:order) }
    let(:order_item) { create(:order_item) }
    let(:params) { attributes_for(:order_item, order_id: order.id) }

    before do
      cookies[:order_id] = order.id
      patch :update, params: { id: order_item.id, order_item: params }
    end

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('order_items.update.success')) }
    it { expect(cookies[:order_id].to_i).to eq(order.id) }
  end

  describe 'DELETE /order_item/{id}' do
    let(:order) { create(:order) }
    let(:order_item) { create(:order_item, order_id: order.id) }

    before do
      cookies[:order_id] = order.id
      delete :destroy, params: { id: order_item.id }
    end

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('order_items.destroy.success')) }
    it { expect(cookies[:order_id].to_i).to eq(order.id) }
  end
end
