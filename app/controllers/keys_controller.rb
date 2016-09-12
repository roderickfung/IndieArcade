class KeysController < ApplicationController

  def new
    @game = Game.find_by_id params[:game_id]
  end

  def create
    @game = Game.find_by_id params[:game_id]
    @game.key_map = params[:key].to_json
    @game.save
    redirect_to game_path(@game)
  end

  def update
    @game = Game.find_by_id params[:game_id]
    @key_map = @game.key_map
    redirect_to game_path(@game)
  end


end
