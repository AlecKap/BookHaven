require 'rails_helper'

RSpec.describe 'library index' do
  describe 'as a visitor, when I visit the library index page' do
    before :each do
      @libraries = FactoryBot.create_list(:library, 5)
      visit libraries_path
    end

    it 'I see the BookHaven name and it is a link to the root_path' do
      expect(page).to have_link("BookHaven")

      click_link("BookHaven")

      expect(current_path).to eq(root_path)
    end

    it 'I see a section called All Libraries' do
      expect(page).to have_css(".all-libraries")
      expect(page).to have_content("All Libraries")
    end

    it 'I see a list of all libraries with their attributes' do
      within(".all-libraries") do
        @libraries.each do |library|
          expect(page).to have_content(library.name)
          expect(page).to have_content(library.street)
          expect(page).to have_content(library.city)
          expect(page).to have_content(library.state)
          expect(page).to have_content(library.zip)
        end
      end
    end

    it 'I see that each library name is a link to that libraries show page' do
      expect(page).to have_link(Library.first.name)
      expect(page).to have_link(Library.second.name)
      expect(page).to have_link(Library.last.name)
    end

    it 'When I click on a library name link, I am taken to that libraries show page' do
      click_link(Library.first.name)

      expect(current_path).to eq(library_path(Library.first))
    end
  end
end