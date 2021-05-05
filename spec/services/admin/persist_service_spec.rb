RSpec.describe Admin::PersistService do
  describe '#call' do
    context 'when save category with invalid params' do
      let(:invalid_category_params) { { category: attributes_for(:category, name: '') } }

      it 'returns false' do
        expect(described_class.new(entity: :category, params: invalid_category_params).call).to be false
      end
    end

    context 'when save category with valid params' do
      let(:valid_category_params) { { category: attributes_for(:category) } }

      it 'returns true' do
        expect(described_class.new(entity: :category, params: valid_category_params).call).to be true
      end
    end
  end
end
