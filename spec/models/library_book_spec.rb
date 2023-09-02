require 'rails_helper'

RSpec.describe LibraryBook, type: :model do
  describe 'relationships' do
    it { should belong_to(:book) }
    it { should belong_to(:library) }
  end
end