RSpec.describe 'SignUp', type: :feature do
  let(:sign_up_page) { Pages::Devise::SignUp.new }

  before { sign_up_page.load }

  context 'with sign up page' do
    it { expect(sign_up_page.auth_form_header).to have_page_name }
    it { expect(sign_up_page.auth_form_header).to have_google_icon }
    it { expect(sign_up_page.auth_form_header).to have_facebook_icon }

    it { expect(sign_up_page.sign_up_form).to have_email_label }
    it { expect(sign_up_page.sign_up_form).to have_email_field }
    it { expect(sign_up_page.sign_up_form).to have_password_label }
    it { expect(sign_up_page.sign_up_form).to have_password_field }
    it { expect(sign_up_page.sign_up_form).to have_confirm_password_label }
    it { expect(sign_up_page.sign_up_form).to have_confirm_password_field }
    it { expect(sign_up_page.sign_up_form).to have_sign_up_button }

    it { expect(sign_up_page).to have_links }

    context 'when fill registration form with invalid data' do
      let(:valid_email) { FFaker::Internet.free_email }
      let(:invalid_password) { 'invalid_password' }

      before do
        sign_up_page.sign_up_form.registrate_user(valid_email, invalid_password, invalid_password)
      end

      it 'show errors' do
        expect(sign_up_page).to have_content(
          I18n.t('activerecord.errors.models.user.attributes.password.invalid')
        )
      end
    end

    context 'when fill registration form with valid data' do
      let(:valid_email) {  FFaker::Internet.free_email }
      let(:valid_password) { 'Password_2021' }

      before do
        sign_up_page.sign_up_form.registrate_user(valid_email, valid_password, valid_password)
      end

      it 'move to root path' do
        expect(sign_up_page).to have_current_path(root_path)
      end

      it 'create new user in database' do
        user = User.find_by email: valid_email
        expect(user).not_to be_nil
      end

      it 'show email confirmation message' do
        expect(sign_up_page).to have_content(
          I18n.t('devise.registrations.signed_up_but_unconfirmed')
        )
      end
    end
  end
end
