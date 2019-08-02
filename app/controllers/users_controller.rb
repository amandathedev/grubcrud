class UsersController < ApplicationController
  include ApplicationHelper
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  
  def edit
    find_user
  end

  def update
    find_user
    if @user.update(user_params)
      flash[:message] = "Your account has been successfully updated."
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    redirect_to login_path and return if !logged_in?

    if current_user.id != params[:id].to_i
      redirect_to current_user
    end

  end

  def destroy
    find_user
    @user.destroy
    flash[:notice] = "User deleted"
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :address, :email, :phone_number)
  end
end
