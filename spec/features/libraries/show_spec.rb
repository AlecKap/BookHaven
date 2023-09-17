require 'rails_helper'

RSpec.describe 'Library Show Page' do
  describe 'As a visitor, when I visit a library show page' do
    before (:each) do
      VCR.use_cassette('returns_the_number_of_books_at_the_library') do
        @library = FactoryBot.create(:library, books_count: 5)
        visit library_path(@library)    
      end
    end

    it 'I see the BookHaven name and it is a link to the root_path' do
      expect(page).to have_link("BookHaven")
      
      click_link("BookHaven")
      
      expect(current_path).to eq(root_path)
    end

    it 'I see the name and address of the library' do
      expect(page).to have_content(@library.name)
      expect(page).to have_content(@library.full_address)
    end

    it 'I see a button Return to Libraries that takes me to the library index page' do
      expect(page).to have_button("Return to Libraries")
      
      click_button("Return to Libraries")

      expect(current_path).to eq(libraries_path)
    end

    it 'I see a button to Add a book to this library' do
      expect(page).to have_button("Add a Book")
    end

    it 'When I click the Add a Book button a form appears to add a books ISBN' do
      click_button("Add a Book")
      
      expect(page).to have_field(:isbn)
      expect(page).to have_button("Add Book")
      expect(page).to have_button("Cancel")
      expect(page).to_not have_button("Add a Book")

      click_button("Cancel")

      expect(page).to_not have_field(:isbn)
      expect(page).to_not have_button("Add Book")
      expect(page).to have_button("Add a Book")
    end

    it 'I see a list of all the books images at this library and each image is a link' do
      @library.books.each do |book|
        within("#book_#{book.id}") do
          expect(page).to have_css("img[src*='#{book.book_img}']")
          expect(page).to have_link('', href: library_book_path(@library, book))
        end
      end
    end

    it 'When I click on a book image, I am taken to that books show page' do
      click_link('', href: library_book_path(@library, @library.books.first))

      expect(current_path).to eq(library_book_path(@library, @library.books.first))
    end
  end
end