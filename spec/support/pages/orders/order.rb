module Pages
  module Orders
    class Order < SitePrism::Page
      set_url '/orders'

      section :orders, Sections::Orders::Orders, '.hidden-xs > table.table'
      section :order_summary, Sections::Orders::OrderSummary, '.general-order-wrap'
    end
  end
end
