class BookDecorator < ApplicationDecorator
  delegate_all

  def authors_list
    object.authors.map { |author| author.decorate.name }.join(', ')
  end
end
