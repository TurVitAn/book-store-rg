RSpec.describe Settings::AddressService do
  let(:user) { create(:user) }
  let(:invalid_params) { attributes_for(:address, zip_code: '') }

  describe '#call' do
    context 'with invalid params' do
      it 'returns false' do
        expect(described_class.new(user: user, params: invalid_params).call).to be false
      end
    end
  end
end
