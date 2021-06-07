RSpec.describe OrdersPresenter do
  subject(:presenter) { described_class.new }

  let(:order) { create(:order, status: status) }

  describe '#add_class_for_status' do
    context 'when order has delivered status' do
      let(:status) { Order.statuses[:delivered] }

      it 'returns css class for delivered status' do
        expect(presenter.add_class_for_status(order)).to eq(described_class::DELIVERED_STATUS_CLASS)
      end
    end

    context 'when order has in delivery status' do
      let(:status) { Order.statuses[:in_delivery] }

      it 'returns css class for in delivery status' do
        expect(presenter.add_class_for_status(order)).to eq(described_class::IN_DELIVERY_STATUS_CLASS)
      end
    end

    context 'when order has canceled status' do
      let(:status) { Order.statuses[:canceled] }

      it 'returns css class for canceled status' do
        expect(presenter.add_class_for_status(order)).to eq(described_class::CANCELED_STATUS_CLASS)
      end
    end

    context 'when order has complete status' do
      let(:status) { Order.statuses[:complete] }

      it 'returns css class for other status' do
        expect(presenter.add_class_for_status(order)).to eq(described_class::OTHER_STATUSES_CLASS)
      end
    end
  end
end
