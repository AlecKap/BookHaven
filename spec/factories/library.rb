FactoryBot.define do
  factory :library do
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    
    # Define a transient attribute for the number of books
    transient do
      books_count { 0 }
    end

    # Create books association if books_count is greater than 0
    after(:create) do |library, evaluator|
      if evaluator.books_count > 0
        create_list(:book, evaluator.books_count)
        create_list(:library_book, evaluator.books_count, library: library)
      end
    end
  end
end