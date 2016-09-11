class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :fun, presence: true
  validates :playability, presence: true
  validates :difficulty, presence: true

end
