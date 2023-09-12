class Library < ApplicationRecord
  has_many :library_books
  has_many :books, through: :library_books

  def full_address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def book_count
    books.count
  end
end
