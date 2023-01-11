class BooksController < ApplicationController
  def index
    @book = Book.new
    @books =Book.all
  end
  
  def create
    @book= Book.new(book_params)
    @book.user_id=current_user.id
    @biik.save
    redirect_to book_path
  end


  def show
  end

  def edit
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  
  #?
  def list_params
    params.require(:list).permit(:title, :body, :image)  
  end
  
end
