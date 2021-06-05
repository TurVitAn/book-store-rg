module Pages
  module Admin
    module Deliveries
      class NewDelivery < SitePrism::Page
        set_url('admin/deliveries/new')

        section :fields, Sections::Admin::Deliveries::CreateForm, '#main_content'
      end
    end
  end
end
