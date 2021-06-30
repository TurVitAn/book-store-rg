RSpec.describe 'CheckoutLogin', type: :feature do
  let_it_be(:book) { create(:book).decorate }
  let(:home_page) { Pages::HomePage::Home.new }
  let(:checkout_login_page) { Pages::Checkouts::Login.new }

  before do
    home_page.load
    home_page.slider.buy_now_buttons.map(&:click)
    checkout_login_page.load
  end

  describe 'checkout login page' do
    context 'with page elements' do
      it { expect(checkout_login_page.returning_customer).to have_form_header }
      it { expect(checkout_login_page.returning_customer).to have_email_label }
      it { expect(checkout_login_page.returning_customer).to have_email_field }
      it { expect(checkout_login_page.returning_customer).to have_password_label }
      it { expect(checkout_login_page.returning_customer).to have_password_field }
      it { expect(checkout_login_page.returning_customer).to have_forgot_password_link }
      it { expect(checkout_login_page.returning_customer).to have_login_with_password_button }

      it { expect(checkout_login_page.new_customer).to have_form_header }
      it { expect(checkout_login_page.new_customer).to have_email_label }
      it { expect(checkout_login_page.new_customer).to have_email_field }
      it { expect(checkout_login_page.new_customer).to have_continue_to_checkout_button }
    end

    context 'when fill in new customer form with invalid email' do
      before { checkout_login_page.new_customer.fill_in_form('') }

      it { expect(checkout_login_page).to have_content(I18n.t('alert.blank')) }
    end

    context 'when fill in new customer form with existing email' do
      let(:user) { create(:user) }
      let(:new_user) { User.new(email: user.email) }

      before do
        new_user.validate
        checkout_login_page.new_customer.fill_in_form(user.email)
      end

      it { expect(checkout_login_page).to have_content(new_user.errors.full_messages_for(:email).to_sentence) }
    end

    context 'when fill in new customer form with valid email' do
      let(:email) { attributes_for(:user)[:email] }

      before { checkout_login_page.new_customer.fill_in_form(email) }

      it { expect(checkout_login_page).to have_content(I18n.t('devise.passwords.send_instructions')) }
    end

    context 'when fill in returning customer form' do
      let(:user) { create(:user) }

      before { checkout_login_page.returning_customer.fill_in_form(user) }

      it { expect(checkout_login_page).to have_content(I18n.t('devise.sessions.signed_in')) }
    end
  end
end
