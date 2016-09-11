class AdminsController < ApplicationController
    before_action :authorize_admin
    before_action :find_user, only: [:show]
    before_action :find_games, only: [:show]

    def show
    end

    def find_games
        @games = Game.where(status: 'pending')
    end

    def find_user
        @users = User.where(approved_user: false)
    end
end
