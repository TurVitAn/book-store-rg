class BookImageDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetTagHelper
  delegate_all

  def image(thumbnail: :small)
    image_tag(object.image_url(thumbnail))
  end
end
