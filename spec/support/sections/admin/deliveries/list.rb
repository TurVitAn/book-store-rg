module Sections
  module Admin
    module Deliveries
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :kind_column, '.col-kind'
        element :price_column, '.col-price'
        element :from_days_column, '.col-from_days'
        element :to_days_column, '.col-to_days'
      end
    end
  end
end
