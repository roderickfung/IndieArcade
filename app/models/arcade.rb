class Arcade < ApplicationRecord

  has_many :arcade_games, dependent: :destroy
  has_many :games, through: :arcade_game
  
end
