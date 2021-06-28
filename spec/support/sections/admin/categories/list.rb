module Sections
  module Admin
    module Categories
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :name_column, '.col-name'
      end
    end
  end
end
