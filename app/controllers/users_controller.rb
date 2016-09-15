class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin!, only: [:index, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        flash[:notice] = params[:notice]
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.html { redirect_to home_path, notice: 'User was successfully created for review!' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def approved
        @user = User.find params[:id]
        @user.approved_user = 'Approved'
        @user.save
        redirect_to admin_path, notice: @user.company_name + ', is now an approved user!'
    end

    def rejected
        @user = User.find params[:id]
        @user.approved_user = 'Rejected'
        @user.save
        redirect_to admin_path, notice: @user.company_name + ' has been rejected!'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:company_name, :company_logo, :website, :twitter, :admin, :approved_user, :number_of_employees, :email, :password, :password_confirmation, :image)
      end
end
