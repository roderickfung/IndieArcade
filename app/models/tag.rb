class Tag < ApplicationRecord

  has_many :tag_games, dependent: :destroy
  has_many :games, through: :tag_game

end
