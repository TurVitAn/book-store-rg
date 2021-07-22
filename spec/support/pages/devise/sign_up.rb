module Pages
  module Devise
    class SignUp < SitePrism::Page
      set_url '/users/sign_up'

      section :auth_form_header, Sections::Devise::AuthFormHeader, '.container > div.text-center'
      section :sign_up_form, Sections::Devise::SignUpForm, '.general-form'
      sections :links, Sections::Devise::SignUpLinks, '.general-sign-text'
    end
  end
end
