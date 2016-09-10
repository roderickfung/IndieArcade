class Review < ApplicationRecord
  belongs_to :game

  validates :fun, presence: true
  validates :playability, presence: true
  validates :difficulty, presence: true
  
end
