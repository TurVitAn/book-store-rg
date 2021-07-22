module Sections
  module Devise
    class ForgotPasswordForm < SitePrism::Section
      element :email_label, 'label[for="user_email"]'
      element :email_field, '#user_email'
      element :send_instructions_button, 'input[type="submit"]'
      element :cancel_link, '.in-gold-500'

      def fill_in(email)
        email_field.set(email)
        send_instructions_button.click
      end
    end
  end
end
