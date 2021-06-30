RSpec.describe 'Cart', type: :feature do
  let_it_be(:book) { create(:book).decorate }
  let(:user) { create(:user) }
  let(:home_page) { Pages::HomePage::Home.new }

  before do
    login_as(user, scope: :user)
    home_page.load
    home_page.slider.buy_now_buttons.map(&:click)
  end

  describe 'cart show page' do
    let(:cart_page) { Pages::Cart::Show.new }

    before { cart_page.load }

    context 'with page elements' do
      it { expect(cart_page.orders).to have_book_title }
      it { expect(cart_page.orders).to have_book_price }
      it { expect(cart_page.orders).to have_quantity_input }
      it { expect(cart_page.orders).to have_minus_link }
      it { expect(cart_page.orders).to have_plus_link }
      it { expect(cart_page.orders).to have_sub_total_price }
      it { expect(cart_page.orders).to have_remove_items_link }

      it { expect(cart_page.orders).to have_content(book.title) }
      it { expect(cart_page.orders).to have_content(book.price) }

      it { expect(cart_page.cart_summary).to have_coupon_code_field }
      it { expect(cart_page.cart_summary).to have_apply_coupon_button }
      it { expect(cart_page.cart_summary).to have_summary_block }
    end

    context 'when click plus icon' do
      before { cart_page.orders.plus_link.click }

      it { expect(cart_page).to have_content(I18n.t('order_items.update.success')) }
    end

    context 'when click minus icon with one book' do
      let(:error_message) { I18n.t('order_items.alert') }

      before { cart_page.orders.minus_link.click }

      it { expect(cart_page).to have_content(error_message) }
    end

    context 'when click remove item link' do
      before { cart_page.orders.remove_items_link.click }

      it { expect(cart_page).not_to have_orders }
      it { expect(cart_page).not_to have_cart_summary }
    end
  end
end
