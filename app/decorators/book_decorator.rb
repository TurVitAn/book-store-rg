class BookDecorator < ApplicationDecorator
  NEWEST_BOOKS_COUNT = 3

  delegate_all
  decorates_association :authors

  def authors_list
    object.authors.map { |author| author.decorate.name }.join(', ')
  end
end
