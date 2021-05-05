module Pages
  module Admin
    module Categories
      class Categories < SitePrism::Page
        set_url('admin/categories')

        section :main_content, Sections::Admin::Categories::List, '#index_table_categories'
      end
    end
  end
end
