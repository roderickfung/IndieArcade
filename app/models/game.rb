class Game < ApplicationRecord

  has_many :tag_games, dependent: :destroy
  has_many :tags, through: :tag_game

  has_many :arcade_games, dependent: :destroy
  has_many :arcades, through: :arcade_game

  has_many :reviews
  belongs_to :user

  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :purchase_url, presence: false, uniqueness: {case_sensitive: false}
  validates :game_description, presence: true, length: { maximum: 500 }
  validates :image, presence: true

  def self.search(search)
    where("title ILIKE ? OR game_description ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
