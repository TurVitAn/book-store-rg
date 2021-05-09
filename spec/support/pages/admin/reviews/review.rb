module Pages
  module Admin
    module Reviews
      class Review < SitePrism::Page
        set_url 'admin/reviews/{id}'

        section :review_details, Sections::Admin::Reviews::Details, '#main_content'
        section :actions, Sections::Admin::Reviews::Actions, '#titlebar_right'
      end
    end
  end
end
