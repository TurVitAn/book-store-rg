RSpec.describe OrderItemDecorator do
  let(:book) { build(:book, price: 5.00) }
  let(:order_item) { build(:order_item, book: book, quantity: 3).decorate }

  describe '#subtotal_price' do
    it { expect(order_item.subtotal_price).to eq(15.00) }
  end
end
