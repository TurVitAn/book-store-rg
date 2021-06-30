module Pages
  module Cart
    class Show < SitePrism::Page
      set_url '/cart'

      section :orders, Sections::Cart::Orders, '.hidden-xs > table.table'
      section :cart_summary, Sections::Cart::CartSummary, '.general-order-wrap'
    end
  end
end
