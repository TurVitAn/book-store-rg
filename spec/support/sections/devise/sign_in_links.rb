module Sections
  module Devise
    class SignInLinks < SitePrism::Section
      element :sign_up_link, '.sign_up>a'
      # element :confirm_account_link, '.confirm>a'
    end
  end
end
