module Pages
  module Admin
    module Authors
      class Authors < SitePrism::Page
        set_url('admin/authors')

        section :main_content, Sections::Admin::Authors::List, '#index_table_authors'
      end
    end
  end
end
