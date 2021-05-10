module Pages
  module Admin
    module Reviews
      class Reviews < SitePrism::Page
        set_url 'admin/reviews'

        section :main_content, Sections::Admin::Reviews::List, '#collection_selection'
      end
    end
  end
end
