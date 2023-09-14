class Libraries::BooksController < ApplicationController

  def show
    
  end
  def new
    @library = Library.find(params[:library_id])
  end

  def create
  end
end
