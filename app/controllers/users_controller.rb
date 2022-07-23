class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
     @users = User.all
  end  

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
   def create
    @user = User.new(user_params)
    @user = current_user.id
    if @user.save
      redirect_to user_path
    else
      render :new
    end
   end
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
