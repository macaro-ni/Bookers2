class BooksController < ApplicationController
  def index
    @book = Book.new
    @books =Book.all
  end

  def create
    @book= Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.new
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  #?
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end