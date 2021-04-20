RSpec.describe AuthorDecorator do
  let(:author) { create(:author, first_name: 'Vitalii', last_name: 'Turzhanskyi').decorate }

  it '#full_name' do
    expect(author.full_name).to eq('Vitalii Turzhanskyi')
  end
end
