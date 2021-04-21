module Sections
  class Header < SitePrism::Section
    element :brand_name, 'a.navbar-brand'

    element :home_link, 'div.hidden-xs>ul>li>a.home_link'
    element :my_account_link, 'div.hidden-xs>ul>li>a.my_account_link'
    element :shop_link, 'li.dropdown>a.shop_link'
    element :log_out_link, '.dropdown-menu>li>a.log_out_link'
  end
end
