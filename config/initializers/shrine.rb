require 'shrine'

Shrine.plugin :activerecord
Shrine.plugin :instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives
Shrine.plugin :derivation_endpoint,
              secret_key: Rails.application.secret_key_base

case Rails.configuration.upload_server
when :s3
  require 'shrine/storage/s3'

  s3_options = {
    bucket: Rails.application.credentials.dig(:aws, :bucket),
    region: Rails.application.credentials.dig(:aws, :region),
    access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key)
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(**s3_options)
  }

  Shrine.plugin :presign_endpoint, presign_options: lambda { |request|
    filename = request.params['filename']
    type = request.params['type']

    {
      content_disposition: ContentDisposition.inline(filename),
      content_type: type,
      content_length_range: 0..(10 * 1024 * 1024)
    }
  }
when :app
  require 'shrine/storage/file_system'

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads')
  }

  Shrine.plugin :upload_endpoint
end
