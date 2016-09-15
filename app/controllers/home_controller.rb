class HomeController < ApplicationController
    def index
        @user = User.all
        @arcades = Arcade.all
        @hash = Gmaps4rails.build_markers(@arcades) do |arcade, marker|
            marker.lat arcade.latitude
            marker.lng arcade.longitude
            marker.infowindow build_info_window(arcade)
            marker.picture(url: 'http://findicons.com/files/icons/1588/farm_fresh_web/32/joystick_add.png',
                           width: 32,
                           height: 32)
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


        </div>"
    end

    def new
        render layout: 'landing'
    end
end
