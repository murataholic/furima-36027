FactoryBot.define do
  factory :item do
    name            { Faker::Name.initials(number: 4) }
    description     { Faker::Lorem.sentence }
    category_id     { rand(2..11) }
    condition_id    { rand(2..7) }
    delivery_fee_id { rand(2..3) }
    prefecture_id   { rand(2..48) }
    shipping_day_id { rand(2..4) }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
