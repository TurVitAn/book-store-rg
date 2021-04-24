RSpec.describe 'SettingsAddresses', type: :feature do
  include_context 'when create and login user for settings'

  let(:valid_address_params) { attributes_for(:address) }
  let(:invalid_address_params) do
    attributes_for(:address, first_name: '', last_name: '', address: '', city: '', zip_code: '', phone: '-3')
  end

  describe 'when billing addresses section' do
    context 'with billing address inputs' do
      %i[first_name_input last_name_input address_input city_input
         zip_code_input country_select phone_input].each do |field|
        it { expect(settings_page.billing_address_form).to public_send("have_#{field}") }
      end
    end

    context 'with invalid billing address params' do
      let(:result_messages) do
        {
          invalid_name: I18n.t('addresses.validation.names_format'),
          invalid_address: I18n.t('addresses.validation.address_format'),
          invalid_zip_code: I18n.t('addresses.validation.zip_format'),
          invalid_phone: I18n.t('addresses.validation.phone_format'),
          invalid_country_code: I18n.t('addresses.validation.phone_country_code')
        }
      end

      before { settings_page.billing_address_form.submit(invalid_address_params) }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.billing_address_form.public_send("#{field}_input").value)
            .to have_content(invalid_address_params[field])
        }
      end

      it {
        expect(settings_page.billing_address_form.country_select.value)
          .to have_content(invalid_address_params[:country])
      }

      it { expect(settings_page).to have_content(result_messages[:invalid_name]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_address]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_zip_code]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_phone]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_country_code]) }
    end

    context 'with valid billing address params' do
      before { settings_page.billing_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('addresses.create.success')) }

      it {
        expect(settings_page.billing_address_form.country_select.value)
          .to have_content(valid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.billing_address_form.public_send("#{field}_input").value)
            .to have_content(valid_address_params[field])
        }
      end
    end
  end

  describe 'when shipping addresses section' do
    context 'with shipping address inputs' do
      %i[first_name_input last_name_input address_input city_input
         zip_code_input country_select phone_input].each do |field|
        it { expect(settings_page.shipping_address_form).to public_send("have_#{field}") }
      end
    end

    context 'with invalid shipping address params' do
      let(:result_messages) do
        {
          invalid_name: I18n.t('addresses.validation.names_format'),
          invalid_address: I18n.t('addresses.validation.address_format'),
          invalid_zip_code: I18n.t('addresses.validation.zip_format'),
          invalid_phone: I18n.t('addresses.validation.phone_format'),
          invalid_country_code: I18n.t('addresses.validation.phone_country_code')
        }
      end

      before { settings_page.shipping_address_form.submit(invalid_address_params) }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.shipping_address_form.public_send("#{field}_input").value)
            .to have_content(invalid_address_params[field])
        }
      end

      it {
        expect(settings_page.shipping_address_form.country_select.value)
          .to have_content(invalid_address_params[:country])
      }

      it { expect(settings_page).to have_content(result_messages[:invalid_name]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_address]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_zip_code]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_phone]) }
      it { expect(settings_page).to have_content(result_messages[:invalid_country_code]) }
    end

    context 'with valid shipping address params' do
      before { settings_page.shipping_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('addresses.create.success')) }

      it {
        expect(settings_page.shipping_address_form.country_select.value)
          .to have_content(valid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.shipping_address_form.public_send("#{field}_input").value)
            .to have_content(valid_address_params[field])
        }
      end
    end
  end
end
