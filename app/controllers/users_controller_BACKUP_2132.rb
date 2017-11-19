class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
<<<<<<< HEAD
    def create
    # #9
         @user = User.new
         @user.name = session[:name]
         @user.email = session[:email]
         @user.password_digest = session[:password]
=======
    def confirm
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation] 
    end
    
    def create
    # #9
         @user = User.new
         @user.name = params[:user][:name]
         @user.email = params[:user][:email]
         @user.password = params[:user][:password]
         @user.password_confirmation = params[:user][:password_confirmation]         
>>>>>>> checkpoint25_3

        # #10
        if @user.save
            flash[:notice] = "Welcome to Bloccit #{@user.name}!"
<<<<<<< HEAD
=======
            create_session(@user)
>>>>>>> checkpoint25_3
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error creating your account. Please try again."
            render :new
        end
    end
    
<<<<<<< HEAD
    def confirm
        @user = User.new
        @user.name = session[:name]
        @user.email = session[:email]
        @user.password_digest = session[:password]
        session[:name] = params[:user][:name]
        session[:email] = params[:user][:email]
        session[:password] = params[:user][:password]
    end
    
=======
>>>>>>> checkpoint25_3
    def nocreate
        redirect_to new_user_path
    end
end
