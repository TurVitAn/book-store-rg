FactoryBot.define do
  factory :user do
    email { "ex#{FFaker::Internet.free_email}" }
    password { "Aa1#{FFaker::Internet.password(8)}" }
    provider { %w[facebook google].sample }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
