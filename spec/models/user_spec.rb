RSpec.describe User, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }

    context 'when email valid' do
      let(:valid_email) { 'user@gmail.com' }
      let(:user) { create(:user, email: valid_email) }

      it { expect { user }.to change(described_class, :count).by(1) }
    end

    context 'when email invalid' do
      let(:invalid_email) { '--user@gmail.com' }
      let(:user) { create(:user, email: invalid_email) }
      let(:error_message) { /is invalid/ }

      it { expect { user }.to raise_error(error_message) }
    end

    context 'when password valid' do
      let(:valid_password) { 'Az_123456' }
      let(:user) { create(:user, password: valid_password) }

      it { expect { user }.to change(described_class, :count).by(1) }
    end

    context 'when password invalid' do
      let(:invalid_password) { 'az_123456' }
      let(:user) { create(:user, password: invalid_password) }
      let(:error_message) { /must contain at least 1 uppercase/ }

      it { expect { user }.to raise_error(error_message) }
    end
  end

  describe '.from_omniauth' do
    context 'when via Facebook' do
      let(:auth) { OmniAuth.config.mock_auth[:facebook] }
      let(:user) { described_class.from_omniauth(auth) }

      it 'returns or create user' do
        expect(user.uid).to eq(auth.uid)
      end
    end

    context 'when via Google' do
      let(:auth) { OmniAuth.config.mock_auth[:google_oauth2] }
      let(:user) { described_class.from_omniauth(auth) }

      it 'returns or create user' do
        expect(user.uid).to eq(auth.uid)
      end
    end
  end
end
