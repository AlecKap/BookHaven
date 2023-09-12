FactoryBot.define do
  factory :library do
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    
    trait :with_5_books do
      FactoryBot.create_list(:book, 5)
      library_books { FactoryBot.create_list(:library_book, 5) }
    end
  end
end