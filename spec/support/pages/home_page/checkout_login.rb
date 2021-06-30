module Pages
  module HomePage
    class CheckoutLogin < SitePrism::Page
      set_url '/checkout_login'

      section :returning_customer, Sections::Homes::CheckoutLogin::ReturningCustomer, '.col-md-5.mb-40'
      section :new_customer, Sections::Homes::CheckoutLogin::NewCustomer, '.col-md-5.mb-60'
    end
  end
end
