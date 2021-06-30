module Pages
  module Admin
    module Coupons
      class EditCoupon < SitePrism::Page
        set_url('admin/coupons/{id}/edit')

        section :fields, Sections::Admin::Coupons::CreateForm, '#main_content'
      end
    end
  end
end
