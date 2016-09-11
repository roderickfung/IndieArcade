class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :fun, presence: true
  validates :playability, presence: true
  validates :difficulty, presence: true

  def graph_parse(value)
    if value == 5
      return 'width: 100%'
    elsif value == 4
      return 'width: 80%'
    elsif value == 3
      return 'width: 60%'
    elsif value == 2
      return 'width: 40%'
    elsif value == 1
      return 'width: 20%'
    end
  end
end
