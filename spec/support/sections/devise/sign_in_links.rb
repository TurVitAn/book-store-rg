module Sections
  module Devise
    class SignInLinks < SitePrism::Section
      element :sign_up_link, '.sign_up > a'
    end
  end
end
