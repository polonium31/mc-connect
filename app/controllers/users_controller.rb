class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update, :destroy]

    #users lists
    def index
        @users = User.where.not(id: current_user.id)
        @current_user_index = params[:user_index].to_i || 0
        @user = @users[@current_user_index]
    end

    #each user show route
    def show
    
    end

    #signup route or new user route
    def new
        @user = User.new
    end

    #new user action
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "User created successfully"
            redirect_to posts_path
        else
        render 'new'
        end
    end

    #edit user route
    def edit
    end

    #edit user action
    def update
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to posts_path
        else
        render 'edit'
        end
    end

    #deletes user action
    def destroy
        if @user.destroy
            flash[:notice] = "Account deleted"
            redirect_to root_path
        else
            flash[:alert] = "Unable to delete account"
        end
    end



    private

    def user_params
        params.require(:user).permit(:name,:email, :password,:program_name,:department,:instagram_link, :linkedin_link)
    end

    def find_user
        @user = User.find(params[:id]) 
    end

end