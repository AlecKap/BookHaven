class Libraries::BooksController < ApplicationController

  def show
  
  end

  def new
    @library = Library.find(params[:library_id])
  end

  def create
    @library = Library.find(params[:library_id])
    BooksFacade.create_book(params[:isbn], @library.id)
    redirect_to library_path(@library)
  end
end
