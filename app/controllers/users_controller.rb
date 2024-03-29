class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update]

  # Users lists
  def index
    @users = User.where.not(id: current_user.id)
    @current_user_index = params[:user_index].to_i || 0
    @user = @users[@current_user_index]
  end

  # Each user show route
  def show
  end

  # Signup route or new user route
  def new
    @user = User.new
  end

  # New user action
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created successfully"
      redirect_to users_path(@user)
    else
      render 'new'
    end
  end

  # Edit user route
  def edit
    @all_skills = Skill.all
  end

  # Edit user action
  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to users_path(@user)
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :program_name, :department, :instagram_link, :linkedin_link, :facebook_link, :github_link, :twitter_link, skill_ids: [])
  end

  def find_user
    @user = User.find(params[:id])
  end
end
