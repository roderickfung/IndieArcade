class GamesController < ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy]
    before_action :authorize_approved_user!, only: [:new]

    GAMES_PER_PAGE = 18
    def index
        find_approved_games
        respond_to do |format|
            if params[:search]
                @games = Game.search(params[:search]).order('created_at DESC').page(params[:page]).per(GAMES_PER_PAGE)
                format.html {}
                format.js { render :games }
            else
                @games = Game.all.order('created_at DESC').page(params[:page]).per(GAMES_PER_PAGE)
                format.html {}
                format.js { render :games }
            end
        end
    end

    def show
        # @message_title ||= params [:title]
        # @message ||= params[:message]
        # @message_email ||= params[:email]

        # GameMailer.notify_game_owner(@game, current_user).deliver_now
        @review = Review.new
        @game = Game.find params[:id]
    end

    def new
        @game = Game.new
        @tag = Tag.all
    end

    def edit
    end

    def create
        @game = Game.new(game_params)
        @game.user = current_user
        if @game.liability
            respond_to do |format|
                if @game.save
                    format.html { redirect_to @game, notice: 'Game was successfully created.' }
                    format.json { render :show, status: :created, location: @game }
                else
                    format.html { render :new }
                    format.json { render json: @game.errors, status: :unprocessable_entity }
                end
            end
        else
            flash[:notice] = 'Must agree to liability waiver!'
            render :new
      end
    end

    def update
        respond_to do |format|
            if @game.update(game_params)
                format.html { redirect_to @game, notice: 'Game was successfully updated.' }
                # format.json { render :show, status: :ok, location: @game }
            else
                format.html { render :edit }
                # format.json { render json: @game.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @game.destroy
        respond_to do |format|
            format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def approved
        @game = Game.find params[:id]
        @game.status = 'Approved'
        @game.save
        redirect_to admin_path, notice: @game.title + ', has been approved!'
    end

    def rejected
        @game = Game.find params[:id]
        @game.status = 'Rejected'
        @game.save
        redirect_to admin_path, notice: @game.title + ', has been rejected!'
    end

    def download_file
        @game = Game.find(params[:id])
        send_file @game.game_file.url
    end
    helper_method :download_file

    private

    def find_approved_games
        @games = Game.where(status: 'Approved')
    end

    def set_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:title, :user_id, :last_in_arcade, :times_played, :status, :purchase_url, :game_description, :categories, :key_map, :image, :date, :game_file, :liability)
    end
end
