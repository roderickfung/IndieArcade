class HomeController < ApplicationController

    def index
        @arcades = Arcade.all
        @hash = Gmaps4rails.build_markers(@arcades) do |arcade, marker|
            marker.lat arcade.latitude
            marker.lng arcade.longitude
        end
    end

    def faq
    end

end
