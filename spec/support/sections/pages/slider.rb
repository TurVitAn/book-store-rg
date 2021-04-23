module Sections
  module Pages
    class Slider < SitePrism::Section
      elements :buy_now_buttons, 'div.general-align>button.btn-primary'
    end
  end
end
