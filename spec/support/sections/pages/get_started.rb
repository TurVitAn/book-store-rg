module Sections
  module Pages
    class GetStarted < SitePrism::Section
      element :get_started_link, 'a.btn-default'
      element :greeting, 'h2.h1'
      element :introduction, 'div.mb-res-50>p'
    end
  end
end
