require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'As a visitor, when I visit the welcome index page' do
    before :each do
      visit root_path
    end

    it 'I see the BookHaven name and it is a link to the root_path' do
      expect(page).to have_link("BookHaven")

      click_link("BookHaven")

      expect(current_path).to eq(root_path)
    end
    
    it 'I see a the BookHaven tag line' do
      expect(page).to have_content("Find a Book, Share a Book")
    end

    it 'I see a breif description of the application' do
      expect(page).to have_css(".app-description")
    end

    it 'i see a link Explore Libraries that takes me to the library index page' do
      expect(page).to have_link("Explore Libraries")

      click_link("Explore Libraries")

      expect(current_path).to eq(libraries_path)
    end
  end
end