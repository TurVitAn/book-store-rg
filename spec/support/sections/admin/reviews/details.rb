module Sections
  module Admin
    module Reviews
      class Details < SitePrism::Section
        element :header, '.panel > h3'
        element :title_row, '.row-title'
        element :text_row, '.row-text'
        element :rating_row, '.row-rating'
        element :status_row, '.row-status'
        element :user_row, '.row-user'
        element :book_row, '.row-book'
      end
    end
  end
end
