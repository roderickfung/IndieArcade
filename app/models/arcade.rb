class Arcade < ApplicationRecord
    has_many :arcade_games, dependent: :destroy
    has_many :games, through: :arcade_game
    geocoded_by :address # can also be an IP address
    after_validation :geocode

    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
    validates :address, presence: true
    validates :phone_number, presence: true
    validates :website, presence: true

    mount_uploader :image, ImageUploader
end
