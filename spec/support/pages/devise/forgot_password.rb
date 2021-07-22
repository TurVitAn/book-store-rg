module Pages
  module Devise
    class ForgotPassword < SitePrism::Page
      set_url '/users/password/new'

      section :auth_form_header, Sections::Devise::AuthFormHeader, '.container > div.text-center'
      section :forgot_password_form, Sections::Devise::ForgotPasswordForm, '.general-form'
    end
  end
end
