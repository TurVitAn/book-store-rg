module Sections
  module Devise
    class AuthFormHeader < SitePrism::Section
      element :page_name, '.general-login-title'
      element :facebook_icon, '.general-login-icon facebook'
      element :google_icon, '.general-login-icon google'
    end
  end
end
