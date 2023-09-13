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

      it 'I see a button to Add a book to this library' do
        expect(page).to have_button("Add a Book")

        
      end
  end
end