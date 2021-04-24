RSpec.describe 'SettingsHeader', type: :feature do
  include_context 'when create and login user for settings'

  describe 'header section' do
    it { expect(settings_page).to have_content(I18n.t('settings.index.settings')) }
    it { expect(settings_page.settings_list).to have_address_link }
    it { expect(settings_page.settings_list).to have_privacy_link }
  end
end
