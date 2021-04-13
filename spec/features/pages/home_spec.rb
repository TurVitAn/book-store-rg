RSpec.describe 'HomePage' do
  let(:home_page) { Pages::Home.new }

  before do
    create(:book)
    home_page.load
  end

  it { expect(home_page).to have_current_path(root_path) }

  it { expect(home_page).to be_all_there }
  it { expect(home_page.header).to be_all_there }
  it { expect(home_page.get_started).to be_all_there }
  it { expect(home_page.footer).to be_all_there }

  it { expect(home_page.slider).to have_buy_now_buttons(count: 1) }

  context 'when click home link' do
    before { home_page.header.home_link }

    it { expect(home_page).to have_current_path(root_path) }
  end

  context 'when click get_started button' do
    before { home_page.get_started.get_started_link.click }

    it { expect(home_page).to have_current_path(books_path) }
  end
end
