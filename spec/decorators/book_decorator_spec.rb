RSpec.describe BookDecorator do
  let(:author) { create(:author, first_name: 'Vitalii', last_name: 'Turzhanskyi') }
  let(:book) do
    create(:book, authors: [author], materials: 'marbled paper', height: 20, width: 13, depth: 5).decorate
  end

  it '#authors_list' do
    expect(book.authors_list).to eq('Vitalii Turzhanskyi')
  end

  it '#materials_list' do
    expect(book.materials_list).to eq('Marbled, paper')
  end

  it '#dimensions' do
    expect(book.dimensions).to eq('H:20.0" x W:13.0" x D:5.0')
  end

  it '#short_description' do
    expect(book.short_description).to eq(
      book.description.truncate(described_class::SHORT_DESCRIPTION_LENGTH)
    )
  end
end
