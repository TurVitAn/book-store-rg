module Sections
  module Layouts
    class Header < SitePrism::Section
      element :brand_name, 'a.navbar-brand'
      element :home_link, 'div.hidden-xs > ul > li > a.home_link'
      element :shop_link, 'li.dropdown>a.shop_link'
      elements :categories_links, 'ul.dropdown-menu > li'
      element :my_account_link, 'div.hidden-xs > ul > li > a.my_account_link'
      element :log_out_link, '.log_out_link'
      element :log_in_link, '.log_in_link'
      element :sign_up_link, '.sign_up_link'
    end
  end
end
