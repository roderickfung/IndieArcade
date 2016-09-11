class ReviewsController < ApplicationController
  before_action :set_reviews
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET games/1/reviews
  def index
    @reviews = @game.reviews
  end

  # GET games/1/reviews/1
  def show
  end

  # GET games/1/reviews/new
  def new
    @review = @game.reviews.build
  end

  # GET games/1/reviews/1/edit
  def edit
  end

  # POST games/1/reviews
  def create
    @review = @game.reviews.build review_params
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to game_path(@game), notice: 'Review was successfully created.' }
        # format.js { render }
      else
        format.html { render action: 'new' }
        # format.js { render }
      end
    end
  end

  # PUT games/1/reviews/1
  def update
    if @review.update_attributes(review_params)
      redirect_to([@review.game, @review], notice: 'Review was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE games/1/reviews/1
  def destroy
    @review.destroy

    redirect_to game_reviews_url(@game)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviews
      @game = Game.find(params[:game_id])
    end

    def set_review
      @review = @game.reviews.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:fun, :playability, :difficulty)
    end
end
