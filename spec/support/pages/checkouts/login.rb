module Pages
  module Checkouts
    class Login < SitePrism::Page
      set_url '/checkouts/login'

      section :returning_customer, Sections::Checkouts::Login::ReturningCustomer, '.col-md-5.mb-40'
      section :new_customer, Sections::Checkouts::Login::NewCustomer, '.col-md-5.mb-60'
    end
  end
end
