class SessionsController < ApplicationController
    def new
    end

    #new session login
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Signed in successfully"
            redirect_to users_path(user)
        else
            flash.now[:alert] = "Invalid username or password"
            render 'new'
        end
    end

    #signout user
    def destroy
        session[:user_id] = nil
        flash.now[:alert] = "You signed out"
        redirect_to root_path
    end
end