module Sections
  module Admin
    module Reviews
      class Actions < SitePrism::Section
        element :approve_button, '.action_item:nth-child(3) > a'
        element :reject_button, '.action_item:last-child > a'
      end
    end
  end
end
