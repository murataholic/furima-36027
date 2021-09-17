FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 4) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation   { password }
    last_name_zenkaku       { Gimei.last.kanji }
    first_name_zenkaku      { Gimei.first.kanji }
    l_name_zenkaku_katakana { Gimei.last.katakana }
    f_name_zenkaku_katakana { Gimei.first.katakana }
    date_of_birth           { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
