class BooksFacade
  def create_book(isbn, library_id)
    book = Book.find_by(isbn: isbn)
    if book.nill?
      # make api call for book
      
    else 
      LibraryBook.create(book_id: book.id, library_id: library_id)
    end
  end
end