RSpec.describe CartItemDecorator do
  let(:book) { build(:book, price: 5.00) }
  let(:cart_item) { build(:cart_item, book: book, quantity: 3).decorate }

  describe '#subtotal_price' do
    it { expect(cart_item.subtotal_price).to eq(15.00) }
  end
end
