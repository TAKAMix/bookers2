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
    if @user.update(user_params)
    flash[:notice]='You have updated user successfully.'
    redirect_to user_path(@user)
    else
    render :edit
    end
  end
  
   def create
    @user = User.new(user_params)
    @user = current_user.id
    if @user.save
      redirect_to user_path
      flash[:notifications]='You have updated user successfully.'
    else
      render :show
    end
   end
  
  
  
  
  
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
