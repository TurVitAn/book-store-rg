FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    text { FFaker::Book.description }
    rating { FFaker::Random.rand(ReviewForm::RATING_RANGE) }
    status { %i[unprocessed approved rejected].sample }
    created_at { FFaker::Time.date }

    book
    user
  end
end
