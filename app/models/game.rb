class Game < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :purchase_url, presence: false, uniqueness: {case_sensitive: false}
  validates :game_description, presence: true, length: { maximum: 500 }
  validates :image, presence: true
end
