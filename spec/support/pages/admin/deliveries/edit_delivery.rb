module Pages
  module Admin
    module Deliveries
      class EditDelivery < SitePrism::Page
        set_url('admin/deliveries/{id}/edit')

        section :fields, Sections::Admin::Deliveries::CreateForm, '#main_content'
      end
    end
  end
end
