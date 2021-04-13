RSpec.describe 'HomePage', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it { expect(home_page).to have_current_path(root_path) }

  it { expect(home_page).to have_header }
  it { expect(home_page).to have_footer }
  it { expect(home_page).to have_slider }

  it { expect(home_page.slider).to have_buy_now_button }
  it { expect(home_page.get_started).to have_get_started_button }
  it { expect(home_page.get_started).to have_greeting }
  it { expect(home_page.get_started).to have_introduction }

  context 'when click home link' do
    before { home_page.header.home_link }

    it { expect(home_page).to have_current_path(root_path) }
  end
end
