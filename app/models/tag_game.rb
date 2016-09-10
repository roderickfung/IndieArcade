class TagGame < ApplicationRecord
  belongs_to :tag
  belongs_to :game
end
