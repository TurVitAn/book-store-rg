RSpec.describe 'CatalogPage', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before { catalog_page.load }

  it { expect(catalog_page).to have_current_path(books_path) }

  it { expect(catalog_page).to be_all_there }

  it 'has page name' do
    expect(catalog_page).to have_content(I18n.t('books.index.catalog'))
  end
end
