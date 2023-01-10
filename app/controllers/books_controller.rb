class BooksController < ApplicationController
  def index
    @book = Book.new
    @books =Book.all
  end


  def show
  end

  def edit
  end
  
  
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)  
  end
  
end
