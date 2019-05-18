class UsersController < ApplicationController
    

    def new
        if current_user
            redirect_to vehicles_url 
        else
            render :new
        end 
    end
    
    def show
        @user = User.find_by(id: params[:id])
        render :show
    end 
    
    def create  
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to vehicles_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name)
    end

end 