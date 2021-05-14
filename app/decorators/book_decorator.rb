class BookDecorator < ApplicationDecorator
  NEWEST_BOOKS_COUNT = 3
  SHORT_DESCRIPTION_SIZE = 250
  DEFAULT_IMAGE = 'active_admin/default.png'.freeze
  COMA = ', '.freeze

  delegate_all
  decorates_association :authors

  def authors_list
    authors.map { |author| author.decorate.full_name }.join(COMA)
  end

  def materials_list
    materials.split.join(COMA).capitalize
  end

  def dimensions
    I18n.t('books.decorator.dimensions_inches', height: height, width: width, depth: depth)
  end

  def short_description
    description.truncate(SHORT_DESCRIPTION_SIZE)
  end

  def more_description?
    description.length > SHORT_DESCRIPTION_SIZE
  end

  def year_publication
    published_at.year
  end

  def image_url(thumbnail)
    object.image_url(thumbnail).presence || DEFAULT_IMAGE
  end
end
