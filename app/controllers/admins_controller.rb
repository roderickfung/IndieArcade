class AdminsController < ApplicationController
    before_action :authorize_admin!
    before_action :find_user, only: [:show]
    before_action :find_games, only: [:show]
    before_action :find_arcades, only: [:show]

    def show

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

    def approved

    end

    def reject

    end
end
