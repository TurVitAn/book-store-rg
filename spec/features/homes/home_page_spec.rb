RSpec.describe 'HomePage', type: :feature do
  let_it_be(:book) { create(:book) }
  let(:home_page) { Pages::HomePage::Home.new }

  before { home_page.load }

  context 'with home page' do
    it { expect(home_page).to have_current_path(root_path) }

    it { expect(home_page).to have_header }
    it { expect(home_page).to have_slider }
    it { expect(home_page).to have_bestsellers }
    it { expect(home_page).to have_footer }
    it { expect(home_page.slider).to have_buy_now_buttons(count: 1) }
    it { expect(home_page.get_started).to have_get_started_link }
    it { expect(home_page.get_started).to have_greeting }
    it { expect(home_page.get_started).to have_introduction }

    context 'when click get_started link' do
      before { home_page.get_started.click_get_started_link }

      it { expect(home_page).to have_current_path(books_path) }
    end

    context 'with bestsellers partial' do
      let(:bestsellers_list) { Pages::HomePage::Home.new }

      it { expect(bestsellers_list).to have_current_path(root_path) }
    end

    context 'when click home link' do
      before { home_page.click_home_link }

      it { expect(home_page).to have_current_path(root_path) }
    end
  end
end
