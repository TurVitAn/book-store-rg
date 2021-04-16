RSpec.describe 'HomePage', type: :feature do
  let(:home_page) { Pages::HomePage::Home.new }

  before do
    create(:book)
    home_page.load
  end

  it { expect(home_page).to have_current_path(root_path) }

  context 'with header elements' do
    it { expect(home_page.header).to be_all_there }
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

    it { expect(home_page).to have_current_path('/books?locale=en') }
  end

  context 'when user signed in' do
    let(:user) { create(:user) }
    let(:sign_in_page) { Pages::SignIn.new }

    before do
      sign_in_page.load
      sign_in_page.sign_in_form.authenticate_user user.email, user.password
    end

    it { expect(home_page.header).to have_my_account_link }
    it { expect(home_page.header).to have_log_out_link }
  end
end
