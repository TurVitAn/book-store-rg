RSpec.describe Users::OmniauthCallbacksController do
  context 'when auth via Facebook' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    end

    let(:get_facebook) { get :facebook }

    context 'with default behavior' do
      it 'has redirect status' do
        get_facebook
        expect(response).to have_http_status :redirect
      end
    end

    context 'when user is new' do
      before do
        allow(User).to receive(:from_omniauth).and_return(build(:user))
        get_facebook
      end

      it { expect(response).to redirect_to(new_user_registration_path) }
    end

    context 'when user exist' do
      before do
        allow(User).to receive(:from_omniauth).and_return(create(:user))
        get_facebook
      end

      it { expect(response).to redirect_to(root_path) }
    end
  end

  context 'when auth via Google' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    let(:get_google) { get :google_oauth2 }

    context 'with default behavior' do
      it 'has redirect status' do
        get_google
        expect(response).to have_http_status :redirect
      end
    end

    context 'when user is new' do
      before do
        allow(User).to receive(:from_omniauth).and_return(build(:user))
        get_google
      end

      it { expect(response).to redirect_to(new_user_registration_path) }
    end

    context 'when user exist' do
      before do
        allow(User).to receive(:from_omniauth).and_return(create(:user))
        get_google
      end

      it { expect(response).to redirect_to(root_path) }
    end
  end
end
