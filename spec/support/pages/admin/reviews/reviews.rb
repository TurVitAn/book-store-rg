module Pages
  module Admin
    module Reviews
      class Reviews < SitePrism::Page
        set_url 'admin/reviews'

        section :main_content, Sections::Admin::Reviews::List, '#index_table_reviews'
      end
    end
  end
end
