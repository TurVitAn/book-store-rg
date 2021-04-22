RSpec.describe SettingsController, type: :controller do
  describe 'GET /settings' do
    before { get :index }

    it { expect(response).to have_http_status :success }
  end
end
