module Pages
  module Admin
    module Coupons
      class Coupons < SitePrism::Page
        set_url('admin/coupons')

        section :main_content, Sections::Admin::Coupons::List, '#index_table_coupons'
      end
    end
  end
end
