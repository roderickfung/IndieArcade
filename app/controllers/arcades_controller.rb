class ArcadesController < ApplicationController
    before_action :set_arcade, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @limit = 5
        @arcades = Arcade.all.order('created_at DESC').page(params[:page]).per(@limit)
    end

    def show
        @arcades = Arcade.find params[:id]
        @hash = Gmaps4rails.build_markers(@arcades) do |arcade, marker|
            marker.lat arcade.latitude
            marker.lng arcade.longitude
            marker.infowindow build_info_window(arcade)
            marker.picture(url: 'http://findicons.com/files/icons/1588/farm_fresh_web/32/joystick_add.png',
                           width: 32,
                           height: 32)
        end
    end

    def new
        @arcade = Arcade.new
    end

    def edit
    end

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

    def destroy
        @arcade.destroy
        respond_to do |format|
            format.html { redirect_to arcades_url, notice: 'Arcade was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def build_info_window(arcade)
        "<div id='iw-container'>
          <div class='iw-title'>
              #{arcade.title}
          </div>
           <div class='gm-style-iw'>
              <img style='float:right' src='http://#{arcade.image}'/>
              <p>#{arcade.address}
                <br>
                website: #{arcade.website}
                <br>
                Status: #{arcade.status}
                <br>
                <a style='color: blue;' href='/arcades/#{arcade.id}'>View Details </a>
              </p>

        </div>"
    end

    private

    def set_arcade
        @arcade = Arcade.find(params[:id])
    end

    def arcade_params
        params.require(:arcade).permit(:title, :address, :latitude, :longitude, :phone_number, :website, :status, :image)
    end
end
