RSpec.describe 'SignIn', type: :feature do
  let(:user) { create(:user) }
  let(:sign_in_page) { Pages::Devise::SignIn.new }

  before { sign_in_page.load }

  it { expect(sign_in_page).to be_all_there }

  context 'with sign in page' do
    it { expect(sign_in_page.auth_form_header).to have_page_name }
    it { expect(sign_in_page.auth_form_header).to have_google_icon }
    it { expect(sign_in_page.auth_form_header).to have_facebook_icon }

    it { expect(sign_in_page.sign_in_form).to have_email_label }
    it { expect(sign_in_page.sign_in_form).to have_email_field }
    it { expect(sign_in_page.sign_in_form).to have_password_label }
    it { expect(sign_in_page.sign_in_form).to have_password_field }
    it { expect(sign_in_page.sign_in_form).to have_forgot_password_link }
    it { expect(sign_in_page.sign_in_form).to have_remember_me_checkbox }
    it { expect(sign_in_page.sign_in_form).to have_sign_in_button }

    it { expect(sign_in_page).to have_links }

    context 'when fill log in form with invalid data' do
      let(:invalid_password) { 'invalid_password' }

      before do
        sign_in_page.sign_in_form.authenticate_user(user.email, invalid_password)
      end

      it 'stays at the same page' do
        expect(sign_in_page).to have_current_path(new_user_session_path)
      end
    end

    context 'when fill log in form with valid data' do
      before do
        sign_in_page.sign_in_form.authenticate_user(user.email, user.password)
      end

      it 'move to root path' do
        expect(sign_in_page).to have_current_path(root_path)
      end
    end
  end
end
