module Pages
  module Carts
    class Cart < SitePrism::Page
      set_url '/carts'

      section :orders, Sections::Carts::Orders, '.hidden-xs > table.table'
      section :order_summary, Sections::Carts::OrderSummary, '.general-order-wrap'
    end
  end
end
