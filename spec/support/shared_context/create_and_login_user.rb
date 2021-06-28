shared_context 'when create and login user for settings' do
  let(:user) { create(:user) }
  let(:settings_page) { Pages::Settings::SettingsPage.new }

  before do
    login_as(user, scope: :user)
    settings_page.load
  end
end
