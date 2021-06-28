RSpec.describe AdminUser, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end
end
