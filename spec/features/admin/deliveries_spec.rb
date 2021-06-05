RSpec.describe 'Admin::Deliveries', type: :feature do
  let(:admin) { create(:admin_user) }

  before { login_as(admin) }

  describe '/index' do
    let_it_be(:delivery) { create(:delivery) }
    let(:deliveries_page) { Pages::Admin::Deliveries::Deliveries.new }

    before { deliveries_page.load }

    context 'with page elements' do
      it { expect(deliveries_page.main_content).to have_kind_column }
      it { expect(deliveries_page.main_content).to have_price_column }
      it { expect(deliveries_page.main_content).to have_from_days_column }
      it { expect(deliveries_page.main_content).to have_to_days_column }

      it { expect(deliveries_page.main_content).to have_content(delivery.kind) }
      it { expect(deliveries_page.main_content).to have_content(delivery.price) }
      it { expect(deliveries_page.main_content).to have_content(delivery.from_days) }
      it { expect(deliveries_page.main_content).to have_content(delivery.to_days) }
    end
  end

  describe '/new' do
    let(:new_delivery_page) { Pages::Admin::Deliveries::NewDelivery.new }

    before { new_delivery_page.load }

    context 'with page elements' do
      it { expect(new_delivery_page.fields).to have_kind_input }
      it { expect(new_delivery_page.fields).to have_price_input }
      it { expect(new_delivery_page.fields).to have_from_days_input }
      it { expect(new_delivery_page.fields).to have_to_days_input }
      it { expect(new_delivery_page.fields).to have_create_button }
      it { expect(new_delivery_page.fields).to have_cancel_button }
    end

    context 'when fill in form with invalid params' do
      let(:delivery_params) { attributes_for(:delivery, kind: '') }

      before { new_delivery_page.fields.submit(delivery_params) }

      it { expect(new_delivery_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(new_delivery_page.fields.kind_input.value).to have_content(delivery_params[:kind]) }
      it { expect(new_delivery_page.fields.price_input.value).to have_content(delivery_params[:price]) }
      it { expect(new_delivery_page.fields.from_days_input.value).to have_content(delivery_params[:from_days]) }
      it { expect(new_delivery_page.fields.to_days_input.value).to have_content(delivery_params[:to_days]) }
    end

    context 'when fill in form with valid params' do
      let(:delivery_params) { attributes_for(:delivery) }

      before { new_delivery_page.fields.submit(delivery_params) }

      it { expect(new_delivery_page.text).to have_content(delivery_params[:kind]) }
      it { expect(new_delivery_page.text).to have_content(delivery_params[:price]) }
      it { expect(new_delivery_page.text).to have_content(delivery_params[:from_days]) }
      it { expect(new_delivery_page.text).to have_content(delivery_params[:to_days]) }
      it { expect(new_delivery_page.text).to have_content(I18n.t('notice.delivery.saved')) }
    end
  end

  describe '/edit' do
    let_it_be(:delivery) { create(:delivery) }
    let(:edit_delivery_page) { Pages::Admin::Deliveries::EditDelivery.new }

    before { edit_delivery_page.load(id: delivery.id) }

    context 'with page elements' do
      it { expect(edit_delivery_page.fields).to have_kind_input }
      it { expect(edit_delivery_page.fields.kind_input.value).to have_content(delivery.kind) }
      it { expect(edit_delivery_page.fields).to have_price_input }
      it { expect(edit_delivery_page.fields.price_input.value).to have_content(delivery.price) }
      it { expect(edit_delivery_page.fields).to have_from_days_input }
      it { expect(edit_delivery_page.fields.from_days_input.value).to have_content(delivery.from_days) }
      it { expect(edit_delivery_page.fields).to have_to_days_input }
      it { expect(edit_delivery_page.fields.to_days_input.value).to have_content(delivery.to_days) }
      it { expect(edit_delivery_page.fields).to have_create_button }
      it { expect(edit_delivery_page.fields).to have_cancel_button }
    end

    context 'when fill in form with invalid params' do
      let(:delivery_params) { attributes_for(:delivery, kind: '') }

      before { edit_delivery_page.fields.submit(delivery_params) }

      it { expect(edit_delivery_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(edit_delivery_page.fields.kind_input.value).to have_content(delivery.kind) }
      it { expect(edit_delivery_page.fields.price_input.value).to have_content(delivery.price) }
      it { expect(edit_delivery_page.fields.from_days_input.value).to have_content(delivery.from_days) }
      it { expect(edit_delivery_page.fields.to_days_input.value).to have_content(delivery.to_days) }
    end

    context 'when fill in form with valid params' do
      let(:delivery_params) { attributes_for(:delivery) }

      before { edit_delivery_page.fields.submit(delivery_params) }

      it { expect(edit_delivery_page.text).to have_content(delivery_params[:kind]) }
      it { expect(edit_delivery_page.text).to have_content(delivery_params[:price]) }
      it { expect(edit_delivery_page.text).to have_content(delivery_params[:from_days]) }
      it { expect(edit_delivery_page.text).to have_content(delivery_params[:to_days]) }
      it { expect(edit_delivery_page.text).to have_content(I18n.t('notice.delivery.saved')) }
    end
  end
end
