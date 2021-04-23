RSpec.describe 'devise/passwords#new', type: :feature do
  let(:user) { create(:user) }
  let(:forgot_password_page) { Pages::Devise::ForgotPassword.new }

  before { forgot_password_page.load }

  it { expect(forgot_password_page).to be_all_there }

  context 'with passwords/new page' do
    context 'when fill registration form with invalid data' do
      let(:wrong_email) { 'test_user@test.com' }

      before { forgot_password_page.forgot_password_form.fill_in(wrong_email) }

      it 'show email error' do
        expect(forgot_password_page).to have_content(
          I18n.t('errors.messages.not_found')
        )
      end
    end
  end
end
