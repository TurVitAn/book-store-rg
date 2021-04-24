RSpec.describe 'HomePage', type: :feature do
  let(:home_page) { Pages::HomePage::Home.new }

  before do
    create(:book)
    home_page.load
  end

  it { expect(home_page).to have_current_path(root_path) }

  context 'with header elements' do
    it { expect(home_page.header).to have_brand_name }
    it { expect(home_page.header).to have_home_link }
    it { expect(home_page.header).to have_shop_link }
    it { expect(home_page.header).to have_log_in_link }
    it { expect(home_page.header).to have_sign_up_link }
  end

  context 'with slider elements' do
    it { expect(home_page.slider).to have_buy_now_buttons(count: 1) }
  end

  context 'with get started elements' do
    it { expect(home_page.get_started).to be_all_there }
  end

  context 'with footer elements' do
    it { expect(home_page.footer).to be_all_there }
  end

  context 'when click home link' do
    before { home_page.header.home_link }

    it { expect(home_page).to have_current_path(root_path) }
  end

  context 'when click get_started button' do
    before { home_page.get_started.get_started_link.click }

    it { expect(home_page).to have_current_path(books_path) }
  end
end
