class ReviewsController < ApplicationController
    before_action :set_reviews
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = @game.reviews
    end

    def show
    end

    def new
        @review = @game.reviews.build
    end

    def edit
    end

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

    def update
        if @review.update_attributes(review_params)
            redirect_to([@review.game, @review], notice: 'Review was successfully updated.')
        else
            render action: 'edit'
        end
    end

    def destroy
        @review.destroy

        redirect_to game_reviews_url(@game)
    end

    private

    def set_reviews
        @game = Game.find(params[:game_id])
    end

    def set_review
        @review = @game.reviews.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:fun, :playability, :difficulty)
    end
end
