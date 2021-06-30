RSpec.describe OrderItemDecorator do
  let(:book) { build(:book) }
  let(:order_item) { build(:order_item, book: book).decorate }

  describe '#subtotal_order_items_price' do
    let(:subtotal_price_result) { order_item.quantity * book.price }

    it { expect(order_item.subtotal_order_items_price).to eq(subtotal_price_result) }
  end
end
