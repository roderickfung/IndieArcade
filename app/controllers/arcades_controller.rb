class ArcadesController < ApplicationController
    before_action :set_arcade, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin!, only: [:edit, :update, :destroy]
  def index
    end

    # GET /arcades/1
    # GET /arcades/1.json
    def show
      @arcades = Arcade.find params[:id]
        @hash = Gmaps4rails.build_markers(@arcades) do |arcade, marker|
        marker.lat arcade.latitude
        marker.lng arcade.longitude
        marker.infowindow arcade.title
      end

    end

    # GET /arcades/new
    def new
        @arcade = Arcade.new
    end

    # GET /arcades/1/edit
    def edit
    end

    # POST /arcades
    # POST /arcades.json
    def create
        @arcade = Arcade.new(arcade_params)

        respond_to do |format|
            if @arcade.save
                format.html { redirect_to @arcade, notice: 'Arcade was successfully created.' }
                format.json { render :show, status: :created, location: @arcade }
            else
                format.html { render :new }
                format.json { render json: @arcade.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /arcades/1
    # PATCH/PUT /arcades/1.json
    def update
        respond_to do |format|
            if @arcade.update(arcade_params)
                format.html { redirect_to @arcade, notice: 'Arcade was successfully updated.' }
                format.json { render :show, status: :ok, location: @arcade }
            else
                format.html { render :edit }
                format.json { render json: @arcade.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /arcades/1
    # DELETE /arcades/1.json
    def destroy
        @arcade.destroy
        respond_to do |format|
            format.html { redirect_to arcades_url, notice: 'Arcade was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_arcade
        @arcade = Arcade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arcade_params
        params.require(:arcade).permit(:title, :address, :latitude, :longitude, :phone_number, :website, :status, :image)
    end
end
