class BooksController < ApplicationController
  before_action :is_matching_login_user,only: [:edit,:update,:destroy]

  def index
    @book = Book.new
    @books =Book.all
    @user=User.new
  end

  def create
    @book= Book.new(book_params)
    @book.user_id=current_user.id
    @books=Book.all
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def show
    @book_new=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  private

  def book_params
      params.require(:book).permit(:title,:body)
  end
  def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def is_matching_login_user
      book=Book.find(params[:id])
      user_id =book.user.id
      unless user_id==current_user.id
        redirect_to books_path
      end
  end


end