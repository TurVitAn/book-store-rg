RSpec.describe OrderDecorator do
  let(:first_book) { build(:book, price: 5.00) }
  let(:second_book) { build(:book, price: 10.00) }
  let(:first_order_item) { build(:order_item, book: first_book, quantity: 2) }
  let(:second_order_item) { build(:order_item, book: second_book, quantity: 1) }
  let(:order) { build(:order, order_items: [first_order_item, second_order_item]).decorate }

  describe '#items_count' do
    it { expect(order.items_count).to eq(3) }
  end

  describe '#subtotal_price' do
    it { expect(order.subtotal_price).to eq(20.00) }
  end

  describe '#coupon_discount' do
    before { build(:coupon, order: order, discount: 10.00) }

    it { expect(order.coupon_discount).to eq(2.00) }
  end

  describe '#order_total' do
    before { build(:coupon, order: order, discount: 50.00) }

    it { expect(order.order_total).to eq(10.00) }
  end
end
