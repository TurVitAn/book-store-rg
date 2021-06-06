RSpec.describe 'Sorting', type: :feature do
  let(:catalog_page) { Pages::Books::Catalog.new }

  before do
    create_list(:category, 2)
    catalog_page.load
  end

  it { expect(catalog_page).to have_current_path(books_path) }

  it { expect(catalog_page.sorting).to be_all_there }
end
