class HomeController < ApplicationController

    def index
        @arcades = Arcade.all
        @hash = Gmaps4rails.build_markers(@arcades) do |arcade, marker|
        marker.lat arcade.latitude
        marker.lng arcade.longitude
        marker.infowindow build_info_window(arcade)
        marker.picture({
            :url => "http://findicons.com/files/icons/1588/farm_fresh_web/32/joystick_add.png",
            :width   => 32,
            :height  => 32
   })


      end
    end

    def build_info_window(arcade)
      "<div id='iw-container'><div class='iw-title'> <a href='/arcades/#{arcade.id}'>#{arcade.title}</div> </a><br> #{arcade.address} <img src='#{arcade.image}'/></div>"
    end

    def faq
    end

end
