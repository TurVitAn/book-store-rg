module Pages
  module Admin
    module BookImages
      class Edit < SitePrism::Page
        set_url('admin/book_images/{id}/edit')

        section :fields, Sections::Admin::BookImages::CreateForm, '#main_content'
      end
    end
  end
end
