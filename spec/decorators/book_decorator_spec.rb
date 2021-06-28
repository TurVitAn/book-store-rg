RSpec.describe BookDecorator, type: :decorator do
  let(:author) { create(:author, first_name: 'Vitalii', last_name: 'Turzhanskyi') }
  let(:book) do
    create(:book, authors: [author], materials: 'marbled paper', height: 20, width: 13, depth: 5).decorate
  end
  let(:authors_list_result) { 'Vitalii Turzhanskyi' }
  let(:materials_list_result) { 'Marbled, paper' }
  let(:dimensions_result) { 'H: 20.0" x W: 13.0" x D: 5.0"' }

  it '#authors_list' do
    expect(book.authors_list).to eq(authors_list_result)
  end

  it '#materials_list' do
    expect(book.materials_list).to eq(materials_list_result)
  end

  it '#dimensions' do
    expect(book.dimensions).to eq(dimensions_result)
  end

  it '#short_description' do
    expect(book.short_description).to eq(
      book.description.truncate(described_class::SHORT_DESCRIPTION_SIZE)
    )
  end

  it '#more_description?' do
    expect(book).to be_more_description
  end

  it '#year_publication' do
    expect(book.year_publication).to eq(book.published_at.year)
  end
end
