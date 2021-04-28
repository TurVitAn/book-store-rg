FactoryBot.define do
  factory :user do
    email { FFaker::Internet.free_email }
    password { 'Password_2021' }
    provider { 'Facebook' }
    uid { 9.times.map { FFaker::Random.rand(1..9) }.join }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
