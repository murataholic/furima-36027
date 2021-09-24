FactoryBot.define do
  factory :item do
    image           { Faker::Lorem.sentence }
    name            { Faker::Name.initials(number: 4) }
    description     { Faker::Lorem.sentence }
    category_id     { rand(2..11) }
    condition_id    { rand(2..7) }
    delivery_fee_id { rand(2..3) }
    prefecture_id   { rand(2..48) }
    shipping_day_id { rand(2..4) }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end