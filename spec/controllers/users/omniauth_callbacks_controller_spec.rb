RSpec.describe Users::OmniauthCallbacksController do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  context 'with default behavior' do
    it 'has redirect status' do
      get :facebook
      expect(response).to have_http_status :redirect
    end
  end

  context 'when user is new' do
    before do
      allow(User).to receive(:from_omniauth).and_return(build(:user))
      get :facebook
    end

    it { expect(response).to redirect_to(new_user_registration_path) }
  end

  context 'when user exist' do
    before do
      allow(User).to receive(:from_omniauth).and_return(create(:user))
      get :facebook
    end

    it { expect(response).to redirect_to(root_path) }
  end
end
