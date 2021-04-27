module Pages
  module Devise
    class SignIn < SitePrism::Page
      set_url '/users/sign_in'

      section :auth_form_header, Sections::Devise::AuthFormHeader, '.container > div.text-center'
      section :sign_in_form, Sections::Devise::SignInForm, '.general-form'
      sections :links, Sections::Devise::SignInLinks, '.general-sign-text'
    end
  end
end
