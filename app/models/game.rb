class Game < ApplicationRecord
    has_many :tag_games, dependent: :destroy
    has_many :tags, through: :tag_games

    has_many :arcades_games, dependent: :destroy
    has_many :arcades, through: :arcade_games

    has_many :reviews, dependent: :destroy
    belongs_to :user

    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
    validates :game_description, presence: true, length: { maximum: 500 }

    mount_uploader :image, ImageUploader
    mount_uploader :game_file, GameUploader

    after_initialize :set_default

    def self.search(search)
        where('title ILIKE ? OR game_description ILIKE ?', "%#{search}%", "%#{search}%")
    end

    def send_inquery
        GameMailer.notify_game_owner(self, current_user).deliver
    end

    private

    def set_default
        self.status = 'Pending'
    end
end
