module Sections
  module Homes
    class Slider < SitePrism::Section
      elements :buy_now_buttons, 'div.general-align > a.btn-primary'
    end
  end
end
