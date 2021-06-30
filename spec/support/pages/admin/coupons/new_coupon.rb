module Pages
  module Admin
    module Coupons
      class NewCoupon < SitePrism::Page
        set_url('admin/coupons/new')

        section :fields, Sections::Admin::Coupons::CreateForm, '#main_content'
      end
    end
  end
end
