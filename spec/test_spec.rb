require 'rails_helper'

RSpec.describe 'Test' do
  describe 'test' do
    it 'testing factories', :vcr do
      books = FactoryBot.create_list(:book, 5)
      library = FactoryBot.create(:library)

      expect(books.first).to be_a(Book)
      expect(library).to be_a(Library)
      expect(books.count).to eq(5)
    end

    it 'a test for the test, testing factories', :vcr do
      libraries = FactoryBot.create_list(:library, 5)
      books = FactoryBot.create_list(:book, 10)

      library_books = libraries.each do |library|
        books.sample(rand(1..5)).each do |book|
          FactoryBot.create(:library_book, library: library, book: book)
        end
      end
      
      expect(libraries.first).to be_a(Library)
      expect(books.first).to be_a(Book)
      expect(library_books.first.books.first).to be_a(Book)
      expect(library_books.count).to eq(5)
    end
  end
end