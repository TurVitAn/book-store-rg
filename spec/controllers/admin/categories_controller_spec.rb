RSpec.describe Admin::CategoriesController, type: :controller do
  let(:admin) { create(:admin_user) }
  let(:valid_params) { attributes_for(:category) }
  let(:invalid_params) { attributes_for(:category, name: '') }

  before { sign_in(admin) }

  describe 'POST create' do
    before { post :create, params: { category: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:category, name: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/new') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:category) }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(admin_categories_path) }
    end
  end

  describe 'PUT update' do
    let(:category) { create(:category) }

    before { put :update, params: { id: category.id, category: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:category, name: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/edit') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:category) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(admin_categories_path) }
    end
  end
end
