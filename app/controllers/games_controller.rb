class GamesController < ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy]
    before_action :authorize_approved_user!, only: [:new]

    # GET /games
    # GET /games.json
    def index
        respond_to do |format|
            if params[:search]
                @games = Game.search(params[:search]).order('created_at DESC')
                format.html {}
                format.js { render :games }
            else
                @games = Game.all.order('created_at DESC')
                format.html {}
                format.js { render :games }
            end
        end
    end

    # GET /games/1
    # GET /games/1.json
    def show
        # @message_title ||= params [:title]
        # @message ||= params[:message]
        # @message_email ||= params[:email]

        # GameMailer.notify_game_owner(@game, current_user).deliver_now
        @review = Review.new
    end

    # GET /games/new
    def new
        @game = Game.new
    end

    # GET /games/1/edit
    def edit
    end

    # POST /games
    # POST /games.json
    def create
        @game = Game.new(game_params)
        @game.user = current_user

        respond_to do |format|
            if @game.save
                format.html { redirect_to @game, notice: 'Game was successfully created.' }
                format.json { render :show, status: :created, location: @game }
            else
                format.html { render :new }
                format.json { render json: @game.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /games/1
    # PATCH/PUT /games/1.json
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

    # DELETE /games/1
    # DELETE /games/1.json
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

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_game
        @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
        params.require(:game).permit(:title, :user_id, :last_in_arcade, :times_played, :status, :purchase_url, :game_description, :categories, :key_map, :image, :date, :game)
    end
end
