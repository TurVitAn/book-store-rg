RSpec.describe User do
  describe 'datebase columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth.config.mock_auth[:facebook] }

    it 'returns or create user' do
      user = described_class.from_omniauth auth
      expect(user.uid).to eq auth.uid
    end
  end
end
