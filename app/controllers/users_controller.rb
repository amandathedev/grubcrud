class UsersController < ApplicationController
    
    def show
        find_user
    end
    
    def new
        @user = User.new
    end

    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            redirect_to new_user_path
        end
    end
    
    def edit
        find_user
    end

    def update
        find_user
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        find_user
        @user.destroy
        flash[:notice] = "User deleted"
        redirect_to users_path
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :password, :address, :email, :phone_number)
    end
end
