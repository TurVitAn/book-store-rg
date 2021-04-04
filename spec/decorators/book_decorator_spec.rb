RSpec.describe BookDecorator do
  let(:author) { build(:author, first_name: 'Vitalii', last_name: 'Turzhanskyi') }
  let(:book) { build(:book, authors: [author]).decorate }

  it '#authors_list' do
    expect(book.authors_list).to eq('Vitalii Turzhanskyi')
  end
end
