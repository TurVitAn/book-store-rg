module Pages
  module Admin
    module Deliveries
      class Deliveries < SitePrism::Page
        set_url('admin/deliveries')

        section :main_content, Sections::Admin::Deliveries::List, '#index_table_deliveries'
      end
    end
  end
end
