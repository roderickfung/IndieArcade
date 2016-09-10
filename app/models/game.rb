class Game < ApplicationRecord
  has_many :reviews
  belongs_to :user

<<<<<<< HEAD
  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :purchase_url, presence: false, uniqueness: {case_sensitive: false}
  validates :game_description, presence: false, length: { maximum: 500 }
  validates :image, presence: true
=======
  has_many :tag_games, dependent: :destroy
  has_many :tags, through: :tag_game

  has_many :arcade_games, dependent: :destroy
  has_many :arcades, through: :arcade_game
>>>>>>> 1ea2528a499c881f1ab4cbfcd9e3a5458174696b
end
