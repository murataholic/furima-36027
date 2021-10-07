FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code            { '123-4567' }
    prefecture             { 2 }
    city_ward_town_village { '札幌市' }
    house_number           { '1-2-3' }
    building_name          { 'さっぽろテレビ塔' }
    telephone_number       { '01234567890' }
    token                  { "pk_test_abcdefghijklmnopq012345" }
  end
end
