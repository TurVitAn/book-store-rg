RSpec.describe BookDecorator, type: :decorator do
  let(:author) { build(:author, first_name: 'Vitalii', last_name: 'Turzhanskyi') }
  let(:book) do
    build(:book, authors: [author], materials: 'marbled paper', height: 20, width: 13, depth: 5).decorate
  end

  describe '#authors_list' do
    let(:authors_list_result) { 'Vitalii Turzhanskyi' }

    it { expect(book.authors_list).to eq(authors_list_result) }
  end

  describe '#materials_list' do
    let(:materials_list_result) { 'Marbled, paper' }

    it { expect(book.materials_list).to eq(materials_list_result) }
  end

  describe '#dimensions' do
    let(:dimensions_result) { 'H: 20.0" x W: 13.0" x D: 5.0"' }

    it { expect(book.dimensions).to eq(dimensions_result) }
  end

  describe '#short_description' do
    let(:short_description_result) { book.description.truncate(described_class::SHORT_DESCRIPTION_SIZE) }

    it { expect(book.short_description).to eq(short_description_result) }
  end

  describe '#year_publication' do
    let(:year_publication_result) { book.published_at.year }

    it { expect(book.year_publication).to eq(year_publication_result) }
  end

  it '#more_description?' do
    expect(book).to be_more_description
  end
end
