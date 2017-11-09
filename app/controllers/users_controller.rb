class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
    # #9
         @user = User.new
         @user.name = session[:name]
         @user.email = session[:email]
         @user.password = session[:password]

        # #10
        if @user.save
            flash[:notice] = "Welcome to Bloccit #{@user.name}!"
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error creating your account. Please try again."
            render :new
        end
    end
    
    def confirm
        @user = User.new
        @user.name = session[:name]
        @user.email = session[:email]
        @user.password = session[:password]
        session[:name] = params[:user][:name]
        session[:email] = params[:user][:email]
        session[:password] = params[:user][:password]
    end
    
    def nocreate
        redirect_to new_user_path
    end
end
