class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "Please sign in to your account"
            redirect_to signin_path
        end
    end

    
end
