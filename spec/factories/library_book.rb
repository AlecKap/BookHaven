FactoryBot.define do
  factory :library_book do
    association :book
    association :library
  end
end