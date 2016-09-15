class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            if params[:remember_me]
                cookies.permanent[:auth_token] = user.auth_token
            else
                cookies[:auth_token] = user.auth_token
            end
            redirect_to home_path, notice: 'Logged in!'
        else
            flash[:notice] = 'Invalid email or password'
            redirect_to home_path
        end
    end

    def destroy
        cookies.delete(:auth_token)
        redirect_to home_path, notice: 'Logged out!'
    end
end
