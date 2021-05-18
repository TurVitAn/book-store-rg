FactoryBot.define do
  factory :coupon do
    code { FFaker::Name.name }
    discount { FFaker::Random.rand(0.1..100.0).floor(2) }
    is_valid { true }

    cart
  end
end
