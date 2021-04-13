RSpec.describe 'devise/registrations#new', type: :feature do
  let(:sign_up_page) { Pages::SignUp.new }

  before { sign_up_page.load }

  context 'with registrations/new page' do
    it { expect(sign_up_page.auth_form_header).to have_page_name }
    it { expect(sign_up_page.auth_form_header).to have_facebook_icon }

    it { expect(sign_up_page.sign_up_form).to have_email_label }
    it { expect(sign_up_page.sign_up_form).to have_email_field }
    it { expect(sign_up_page.sign_up_form).to have_password_label }
    it { expect(sign_up_page.sign_up_form).to have_password_field }
    it { expect(sign_up_page.sign_up_form).to have_confirm_password_label }
    it { expect(sign_up_page.sign_up_form).to have_confirm_password_field }
    it { expect(sign_up_page.sign_up_form).to have_sign_up_button }

    it { expect(sign_up_page).to have_links }
  end
end
