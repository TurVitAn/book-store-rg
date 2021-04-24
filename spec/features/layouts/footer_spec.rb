RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::HomePage::Home.new }

  before { home_page.load }

  context 'with footer partial' do
    it { expect(home_page).to have_current_path(root_path) }

    it { expect(home_page.footer).to be_all_there }
  end
end
