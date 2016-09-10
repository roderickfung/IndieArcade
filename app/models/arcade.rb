class Arcade < ApplicationRecord

  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :website, presence: true
end
