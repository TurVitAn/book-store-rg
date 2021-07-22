module Sections
  module Devise
    class AuthFormHeader < SitePrism::Section
      element :page_name, '.general-login-title'
      element :google_icon, '.general-login-icon.google'
      element :facebook_icon, '.general-login-icon.facebook'
    end
  end
end
