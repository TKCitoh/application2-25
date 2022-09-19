class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def correct_user
    #@book = Book.find(params[:id])
    #@user = @book.user
    #redirect_to(books_path) unless @user == current_user
  end

end
