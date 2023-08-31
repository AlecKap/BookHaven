FactoryBot.define do
  factory :book do
    isbn { Faker::Number.number(digits: 13) }
    title { Faker::Book.title }
    author { Faker::Book.author }
    description { Faker::Lorem.sentence }
    genre { Faker::Book.genre }
    book_img { FakerHelper.random_image_url(200, 200) }
  end
end