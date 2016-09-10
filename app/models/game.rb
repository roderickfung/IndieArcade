class Game < ApplicationRecord
  has_many :reviews
  belongs_to :user

  has_many :tag_games, dependent: :destroy
  has_many :tags, through: :tag_game

  has_many :arcade_games, dependent: :destroy
  has_many :arcades, through: :arcade_game
end
