require 'rails_helper'

RSpec.describe 'Test' do
  describe 'test' do
    it 'testing factories', :vcr do
      book = create_list(:book, 5)
      library = create(:library)
      # Write some expects
    end

    it 'a test for the test, testing factories', :vcr do
      libraries = create_list(:library, 5)
      books = create_list(:book, 10)

      library_books = libraries.each do |library|
        books.sample(rand(1..5)).each do |book|
          create(:library_book, library: library, book: book)
        end
      end
      # Write some expects
    end
  end
end