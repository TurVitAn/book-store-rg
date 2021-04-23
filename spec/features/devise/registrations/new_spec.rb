RSpec.describe 'devise/registrations#new', type: :feature do
  let(:sign_up_page) { Pages::Devise::SignUp.new }

  before { sign_up_page.load }

  context 'with registrations/new page' do
    it { expect(sign_up_page).to be_all_there }
  end
end
