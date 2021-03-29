RSpec.describe 'Header', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it "has brand name `#{I18n.t('brand')}`" do
    expect(home_page.header.brand_name).to have_text I18n.t('brand')
  end

  it "has `#{I18n.t('header.links.home')}` link" do
    expect(home_page.header).to have_home_link
  end

  it "has `#{I18n.t('header.links.shop')}` link" do
    expect(home_page.header).to have_shop_link
  end

  it "has `#{I18n.t('header.links.shop')}` => `#{I18n.t('header.links.mobile_development')}` link" do
    expect(home_page.header).to have_mobile_development_link
  end

  it "has `#{I18n.t('header.links.shop')}` => `#{I18n.t('header.links.photo')}` link" do
    expect(home_page.header).to have_photo_link
  end

  it "has `#{I18n.t('header.links.shop')}` => `#{I18n.t('header.links.web_design')}` link" do
    expect(home_page.header).to have_web_design_link
  end

  it "has `#{I18n.t('header.links.shop')}` => `#{I18n.t('header.links.log_out')}` link" do
    expect(home_page.header).to have_log_out_link
  end

  it "has `#{I18n.t('header.links.my_account')}` link" do
    expect(home_page.header).to have_my_account_link
  end

  it "click `#{I18n.t('header.links.home')}` link" do
    home_page.click_header_home_link
    expect(home_page).to be_displayed
  end
end
