FactoryBot.define do
  factory :library do
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    book_count { Faker::Number.number(digits: 2) }
  end
end