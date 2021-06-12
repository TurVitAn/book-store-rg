RSpec.describe 'SettingsPrivacy', type: :feature do
  include_context 'when create and login user for settings'

  before do
    settings_page.settings_list.privacy_link.click
  end

  describe 'when email section' do
    context 'with change email form' do
      it { expect(settings_page.email_form).to have_header }
      it { expect(settings_page.email_form).to have_email_label }
      it { expect(settings_page.email_form).to have_email_input }
      it { expect(settings_page.email_form).to have_save_button }
    end

    context 'when fill in email form with invalid email' do
      let(:new_invalid_email) { '!!!' }

      before { settings_page.email_form.submit(new_invalid_email) }

      it { expect(settings_page).to have_content(I18n.t('devise.registrations.update.alert')) }
      it { expect(settings_page).to have_content(I18n.t('activerecord.errors.models.user.attributes.email.invalid')) }
      it { expect(settings_page.email_form.email_input.value).to have_content(new_invalid_email) }
    end
  end

  describe 'when password section' do
    context 'with change password form' do
      it { expect(settings_page.password_form).to have_header }
      it { expect(settings_page.password_form).to have_old_password_label }
      it { expect(settings_page.password_form).to have_new_password_label }
      it { expect(settings_page.password_form).to have_password_confirm_label }

      it { expect(settings_page.password_form).to have_old_password_input }
      it { expect(settings_page.password_form).to have_new_password_input }
      it { expect(settings_page.password_form).to have_password_confirm_input }

      it { expect(settings_page.password_form).to have_save_button }
    end

    context 'with invalid password input' do
      let(:new_invalid_password) { " #{FFaker::Internet.password(8)}" }

      before { settings_page.password_form.fill_in(user.password, new_invalid_password) }

      it { expect(settings_page).to have_content(I18n.t('devise.registrations.update.alert')) }

      it {
        expect(settings_page).to have_content(
          I18n.t('activerecord.errors.models.user.attributes.password.invalid')
        )
      }

      it { expect(settings_page.password_form.old_password_input.value).not_to have_content(user.password) }
      it { expect(settings_page.password_form.new_password_input.value).not_to have_content(new_invalid_password) }
      it { expect(settings_page.password_form.password_confirm_input.value).not_to have_content(new_invalid_password) }
    end

    context 'with valid password input' do
      let(:new_valid_password) { "Aa1#{FFaker::Internet.password(8)}" }

      before { settings_page.password_form.fill_in(user.password, new_valid_password) }

      it { expect(settings_page).to have_current_path(settings_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }

      it { expect(settings_page.password_form.old_password_input.value).not_to have_content(user.password) }
      it { expect(settings_page.password_form.new_password_input.value).not_to have_content(new_valid_password) }
      it { expect(settings_page.password_form.password_confirm_input.value).not_to have_content(new_valid_password) }
    end
  end

  describe 'when remove account section' do
    context 'with remove account form' do
      it { expect(settings_page.remove_account).to have_header }
      it { expect(settings_page.remove_account).to have_remove_confirm_checkbox }
      it { expect(settings_page.remove_account).to have_remove_account_button }
      it { expect(settings_page.remove_account.remove_account_button[:disabled]).to eq('disabled') }
    end

    context 'when click remove account button' do
      before { settings_page.remove_account.remove_account }

      it { expect(settings_page).to have_current_path(root_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.destroyed')) }
    end
  end
end
