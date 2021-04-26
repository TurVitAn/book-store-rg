class BookDecorator < ApplicationDecorator
  NEWEST_BOOKS_COUNT = 3
  SHORT_DESCRIPTION_LENGTH = 250

  delegate_all
  decorates_association :authors

  def authors_list
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def materials_list
    object.materials.split.join(', ').capitalize
  end

  def dimensions
    I18n.t('books.decorator.dimensions_inches', height: object.height, width: object.width, depth: object.depth)
  end

  def short_description
    object.description.truncate(SHORT_DESCRIPTION_LENGTH)
  end

  def more_description?
    object.description.length > SHORT_DESCRIPTION_LENGTH
  end

  def year_publication
    object.published_at.year
  end
end
