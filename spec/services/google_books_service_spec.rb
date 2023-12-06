require 'rails_helper'

RSpec.describe GoogleBooksService do
  describe 'instance methods' do
    describe '#book_info' do
      it 'returns the book info for a given isbn' do
        VCR.use_cassette('returns_book_info_for_a_given_isbn') do
          service = GoogleBooksService.new.book_info("9781503290569")

          expect(service).to be_a(Hash)
          
          book_info = service[:items].first[:volumeInfo]

          expect(book_info).to have_key(:title)
          expect(book_info[:title]).to be_a(String)
          expect(book_info).to have_key(:authors)
          expect(book_info[:authors]).to be_an(Array)
          expect(book_info).to have_key(:description)
          expect(book_info[:description]).to be_a(String)
          expect(book_info).to have_key(:imageLinks)
          expect(book_info[:imageLinks]).to be_a(Hash)
          expect(book_info[:imageLinks]).to have_key(:thumbnail)
          expect(book_info[:imageLinks][:thumbnail]).to be_a(String)
          expect(book_info).to have_key(:categories)
          expect(book_info[:categories]).to be_an(Array)
          expect(book_info).to have_key(:industryIdentifiers)
          expect(book_info[:industryIdentifiers]).to be_an(Array)
          expect(book_info[:industryIdentifiers].first).to have_key(:type)
          expect(book_info[:industryIdentifiers].first[:type]).to be_a(String)
          expect(book_info[:industryIdentifiers].first).to have_key(:identifier)
          expect(book_info[:industryIdentifiers].first[:identifier]).to be_a(String)
        end
      end
    end
  end
end