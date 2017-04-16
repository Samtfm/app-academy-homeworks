class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
    render :index
  end

  def new
    # your code here
    render :new
  end

  def create
    book = Book.new(book_params)
    book.save
    index
    # your code here
  end

  def destroy
    # your code here
    book = Book.find_by_id(params[:id])
    if book.destroy
      index
    else
      throw fail
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
