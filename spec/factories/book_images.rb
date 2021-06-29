FactoryBot.define do
  factory :book_image do
    image { Rack::Test::UploadedFile.new('spec/fixtures/images/default.jpg') }
  end
end
