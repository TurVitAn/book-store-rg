RSpec.describe 'devise/sessions#new', type: :feature do
  let(:user) { create(:user) }
  let(:sign_in_page) { Pages::Devise::SignIn.new }

  before { sign_in_page.load }

  it { expect(sign_in_page).to be_all_there }

  context 'with sessions/new page' do
    context 'when fill log in form with valid data' do
      before do
        sign_in_page.sign_in_form.authenticate_user user.email, user.password
      end

      it 'move to root path' do
        expect(sign_in_page).to have_current_path root_path
      end
    end

    context 'when fill registration form with invalid data' do
      let(:wrong_email) { 'ruby@test.com' }

      before do
        sign_in_page.sign_in_form.authenticate_user wrong_email, user.password
      end

      it 'stays at the same page' do
        expect(sign_in_page).to have_current_path new_user_session_path
      end
    end
  end
end
