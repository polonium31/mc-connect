class ApplicationController < ActionController::Base
    before_action :authorize

    private
  
    def authorize
      redirect_to login_path unless current_user
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
