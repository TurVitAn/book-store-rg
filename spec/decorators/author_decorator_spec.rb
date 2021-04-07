RSpec.describe AuthorDecorator do
  let(:author) { create :author }

  describe '#name' do
    it 'returns string' do
      expect(author.decorate.full_name.class).to eq(String)
    end
  end
end
