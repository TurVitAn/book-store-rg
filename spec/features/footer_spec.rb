RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it "has `#{I18n.t('footer.links.home')}` link" do
    expect(home_page.footer).to have_home_link
  end

  it "has `#{I18n.t('footer.links.shop')}` link" do
    expect(home_page.footer).to have_shop_link
  end

  it "has `#{I18n.t('footer.links.orders')}` link" do
    expect(home_page.footer).to have_orders_link
  end

  it "has `#{I18n.t('footer.links.settings')}` link" do
    expect(home_page.footer).to have_settings_link
  end

  it "has email `#{I18n.t('footer.links.support')}`" do
    expect(home_page.footer).to have_email
  end

  it "has phone number `#{I18n.t('footer.links.phone')}`" do
    expect(home_page.footer).to have_phone
  end

  it 'has facebook link' do
    expect(home_page.footer).to have_facebook_link
  end

  it 'has twitter link' do
    expect(home_page.footer).to have_twitter_link
  end

  it 'has google link' do
    expect(home_page.footer).to have_google_link
  end

  it 'has instagram link' do
    expect(home_page.footer).to have_instagram_link
  end

  it "click `#{I18n.t('footer.links.home')}` link" do
    home_page.click_footer_home_link
    expect(home_page).to be_displayed
  end
end
