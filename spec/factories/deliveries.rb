FactoryBot.define do
  factory :delivery do
    kind { FFaker::Company.name }
    price { FFaker::Random.rand(1.0..1000.0).floor(2) }
    from_days { FFaker::Random.rand(1..5) }
    to_days { FFaker::Random.rand(6..20) }
  end
end
