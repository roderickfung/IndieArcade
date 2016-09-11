class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # this is current_user method without remember me and password reset
    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

    def authorize
        redirect_to '/login' unless current_user
    end

    def current_user
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_user
end
