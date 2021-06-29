RSpec.describe 'Orders', type: :feature do
  let_it_be(:book) { create(:book).decorate }
  let(:user) { create(:user) }
  let(:home_page) { Pages::HomePage::Home.new }

  before do
    login_as(user, scope: :user)
    home_page.load
    home_page.slider.buy_now_buttons.map(&:click)
  end

  describe 'index page' do
    let(:order_page) { Pages::Orders::Order.new }

    before { order_page.load }

    context 'with page elements' do
      it { expect(order_page.orders).to have_book_title }
      it { expect(order_page.orders).to have_book_price }
      it { expect(order_page.orders).to have_quantity_input }
      it { expect(order_page.orders).to have_minus_link }
      it { expect(order_page.orders).to have_plus_link }
      it { expect(order_page.orders).to have_sub_total_price }
      it { expect(order_page.orders).to have_remove_items_link }

      it { expect(order_page.orders).to have_content(book.title) }
      it { expect(order_page.orders).to have_content(book.price) }

      it { expect(order_page.order_summary).to have_coupon_code_field }
      it { expect(order_page.order_summary).to have_apply_coupon_button }
      it { expect(order_page.order_summary).to have_summary_block }
    end

    context 'when click plus icon' do
      before { order_page.orders.plus_link.click }

      it { expect(order_page).to have_content(I18n.t('order_items.update.success')) }
    end

    context 'when click minus icon with one book' do
      let(:error_message) { "Quantity must be greater than #{OrderItemForm::INVALID_QUANTITY}" }

      before { order_page.orders.minus_link.click }

      it { expect(order_page).to have_content(error_message) }
    end

    context 'when click remove item link' do
      before { order_page.orders.remove_items_link.click }

      it { expect(order_page).not_to have_orders }
      it { expect(order_page).not_to have_order_summary }
    end
  end
end
