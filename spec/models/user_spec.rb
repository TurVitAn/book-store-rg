RSpec.describe User, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth.config.mock_auth[:facebook] }

    it 'returns or create user' do
      user = described_class.from_omniauth(auth)
      expect(user.uid).to eq(auth.uid)
    end
  end
end
