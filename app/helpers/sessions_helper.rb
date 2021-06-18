module SessionsHelper
    # Returns the current logged-in user (if any).
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
        User.find_by(id: session[:user_id])
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def log_out
        reset_session
        @current_user = nil
    end
end
