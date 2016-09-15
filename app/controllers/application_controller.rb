class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def authorize
        redirect_to '/login' unless current_user
    end

    def current_user
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_user

    def authorize_admin!
        unless admin?
            flash[:alert] = 'Unauthorized access'
            redirect_to home_path
            false
        end
    end
    helper_method :authorize_admin!

    def admin?
        if current_user
            current_user.admin?
        end
    end
    helper_method :admin?

    def approved_user?
      if current_user
          current_user.approved_user? || current_user.admin?
      end
    end
    helper_method :approved_user?

    def authorize_approved_user!
        unless approved_user? || admin?
            flash[:alert] = 'Unauthorized access'
            redirect_to home_path
            false
        end
    end
    helper_method :authorize_approved_user!
end
