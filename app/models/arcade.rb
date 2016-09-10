class Arcade < ApplicationRecord

  has_many :arcade_games, dependent: :destroy
  has_many :games, through: :arcade_game
  geocoded_by :address   # can also be an IP address
  after_validation :geocode

end
