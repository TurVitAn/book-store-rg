module Sections
  module Admin
    class AdminComments < SitePrism::Section
      element :header, '.panel > h3'
      element :comment_input, '#active_admin_comment_body_input'
      element :add_comment_button, '#active_admin_comment_submit_action > input'
    end
  end
end
