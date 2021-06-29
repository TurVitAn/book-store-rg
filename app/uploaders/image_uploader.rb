class ImageUploader < Shrine
  ALLOWED_TYPES  = %w[image/jpeg image/png image/webp].freeze
  MAX_SIZE       = 10 * 1024 * 1024
  MAX_DIMENSIONS = [5000, 5000].freeze

  THUMBNAILS = {
    small: [300, 300],
    medium: [600, 600],
    large: [800, 800]
  }.freeze

  plugin :remove_attachment
  plugin :pretty_location
  plugin :validation_helpers
  plugin :store_dimensions, log_subscriber: nil
  plugin :derivation_endpoint, prefix: 'derivations/image'

  Attacher.validate do
    validate_size 0..MAX_SIZE

    validate_max_dimensions MAX_DIMENSIONS if validate_mime_type ALLOWED_TYPES
  end

  Attacher.default_url do |derivative: nil, **|
    file&.derivation_url(:thumbnail, *THUMBNAILS.fetch(derivative)) if derivative
  end

  derivation :thumbnail do |file, width, height|
    magick = ImageProcessing::MiniMagick.source(file)
    magick.resize_to_limit!(width, height)
  end
end
