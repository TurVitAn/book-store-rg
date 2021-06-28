RSpec.describe Admin::AuthorsController, type: :controller do
  let(:admin) { create(:admin_user) }

  before { sign_in(admin) }

  describe 'POST create' do
    before { post :create, params: { author: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:author, first_name: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/new') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:author) }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(admin_authors_path) }
    end
  end

  describe 'PUT update' do
    let(:author) { create(:author) }

    before { put :update, params: { id: author.id, author: params } }

    context 'with invalid params' do
      let(:params) { attributes_for(:author, first_name: '') }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template('active_admin/resource/edit') }
    end

    context 'with valid params' do
      let(:params) { attributes_for(:author) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(admin_authors_path) }
    end
  end
end
