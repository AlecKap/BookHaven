require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { should have_many(:library_books) }
    it { should have_many(:libraries).through(:library_books) }
  end
end