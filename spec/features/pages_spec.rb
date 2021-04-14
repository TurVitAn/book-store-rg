RSpec.describe Pages, type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it { expect(home_page).to have_current_path(root_path) }

  context 'with header elements' do
    it { expect(home_page.header).to be_all_there }
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
end
