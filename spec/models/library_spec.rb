require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'relatioships' do
    it { should have_many(:library_books) }
    it { should have_many(:books).through(:library_books) }
  end

  describe 'instance methods' do
    describe '#full_address' do
      it 'returns the full address of the library' do
        library = Library.create!(name: 'Denver Public Library', 
                                  street: '10 W Colfax Ave', 
                                  city: 'Denver', 
                                  state: 'CO', 
                                  zip: 80202)
        
        expect(library.full_address).to eq('10 W Colfax Ave, Denver, CO 80202')
      end
    end

    describe '#book_count' do
      it 'returns the number of books at the library', :vcr do
        library = FactoryBot.create(:library, :with_5_books)
        
        expect(library.book_count).to eq(5)
      end
    end
  end
end