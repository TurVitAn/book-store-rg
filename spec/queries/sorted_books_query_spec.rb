RSpec.describe SortedBooksQuery do
  let!(:web_development_category) { create(:category, name: 'Web Development') }
  let!(:photo_category) { create(:category, name: 'Photo') }
  let!(:book_from_web_development) { create(:book, category: web_development_category) }
  let!(:book_from_photo) { create(:book, category: photo_category) }

  describe '.call' do
    context 'with category_id parameter' do
      it 'returns books from category' do
        expect(described_class.call(category_id: web_development_category.id)).to eq([book_from_web_development])
      end
    end

    context 'with sort_by parameter' do
      let(:books) { [book_from_photo, book_from_web_development] }

      it 'returns books sorted by popular first' do
        expect(described_class.call(sort_by: :popular_asc)).to eq(
          books.sort_by(&:created_at)
        )
      end

      it 'returns books sorted by title desc' do
        expect(described_class.call(sort_by: :title_desc)).to eq(
          books.sort_by(&:title).reverse
        )
      end

      it 'returns books sorted by price asc' do
        expect(described_class.call(sort_by: :price_asc)).to eq(
          books.sort_by(&:price)
        )
      end

      it 'returns books sorted by price desc' do
        expect(described_class.call(sort_by: :price_desc)).to eq(
          books.sort_by(&:price).reverse
        )
      end
    end
  end
end
