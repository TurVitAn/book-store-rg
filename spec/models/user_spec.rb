RSpec.describe User, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  describe 'with associations' do
    it { is_expected.to have_one(:billing_address).class_name('Address').dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).class_name('Address').dependent(:destroy) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_one(:cart).dependent(:destroy) }
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
