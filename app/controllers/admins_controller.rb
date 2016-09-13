class AdminsController < ApplicationController
    before_action :authorize_admin!
    before_action :find_user, only: [:show]
    before_action :find_games, only: [:show]
    before_action :find_arcades, only: [:show]

    PAGES = 18

    def show
      @games = @games.order(created_at: :desc).page(params[:pg_admin_games]).per(PAGES)
      @users = @users.order(created_at: :desc).page(params[:pg_admin_users]).per(PAGES)
      @arcades = @arcades.order(created_at: :desc).page(params[:pg_admin_arcades]).per(PAGES)
    end

    def find_games
        @games = Game.where(status: 'Pending')
    end

    def find_user
        @users = User.where(approved_user: false)
    end

    def find_arcades
        @arcades = Arcade.all
    end

end
